import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/helpers/image_compress_helper.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/add_listing/data/models/listing_image_item.dart';
import 'package:gaza_tech/features/add_listing/data/repos/add_listing_repo.dart';
import 'package:gaza_tech/features/add_listing/ui/add_listing_screen.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/specifications_section.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'add_listing_state.dart';

class AddListingCubit extends Cubit<AddListingState> {
  final AddListingRepo _repo;
  final ListingDetailModel? _existingListing;

  AddListingCubit(this._repo, [this._existingListing])
      : super(AddListingState(isEditMode: _existingListing != null));

  bool get isDraftEdit => _existingListing?.contentStatus == 'draft';

  // Form controllers (per project convention: controllers live in cubit)
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  /// Load categories and locations from DB
  Future<void> loadFormData() async {
    if (state.categories.isNotEmpty && state.locations.isNotEmpty) return;

    emit(state.copyWith(isLoadingFormData: true, errorMessage: null));

    final categoriesResult = await _repo.getCategories();
    final locationsResult = await _repo.getLocations();

    String? error;

    final categories = categoriesResult.when(
      success: (data) => data,
      failure: (err) {
        error = err.message;
        return state.categories;
      },
    );

    final locations = locationsResult.when(
      success: (data) => data,
      failure: (err) {
        error ??= err.message;
        return state.locations;
      },
    );

    emit(
      state.copyWith(
        categories: categories,
        locations: locations,
        isLoadingFormData: false,
        errorMessage: error,
      ),
    );
  }

  /// Pre-populate form for edit mode. Returns initial selections for UI state.
  ({
    String? categoryId,
    String? categoryName,
    String? locationId,
    String? locationName,
    ProductCondition? condition,
    bool isILS,
    List<ListingImageItem> images,
    List<SpecificationEntry> specifications,
  })? initializeForEdit() {
    final listing = _existingListing;
    if (listing == null) return null;

    titleController.text = listing.title;
    priceController.text = listing.price.toString();
    descriptionController.text = listing.description;

    final condition = switch (listing.productCondition) {
      'brand_new' => ProductCondition.brandNew,
      'used_excellent' => ProductCondition.usedExcellent,
      'used_good' => ProductCondition.usedGood,
      'for_parts' => ProductCondition.forParts,
      _ => null,
    };

    final images = listing.imageUrls
        .map<ListingImageItem>((url) => ExistingImage(url))
        .toList();

    final specs = <SpecificationEntry>[];
    if (listing.specifications != null) {
      for (final entry in listing.specifications!.entries) {
        final spec = SpecificationEntry();
        spec.nameController.text = entry.key;
        spec.valueController.text = entry.value.toString();
        specs.add(spec);
      }
    }

    final cat = state.categories.where((c) => c.id == listing.categoryId);
    final loc = state.locations.where(
      (l) => l.locationId == listing.locationId,
    );

    return (
      categoryId: listing.categoryId,
      categoryName: cat.isNotEmpty ? cat.first.name : null,
      locationId: listing.locationId,
      locationName: loc.isNotEmpty ? loc.first.name : null,
      condition: condition,
      isILS: listing.currency != 'USD',
      images: images,
      specifications: specs,
    );
  }

  /// Create a listing with all form data
  Future<void> createListing({
    required String? selectedCategoryId,
    required String? selectedLocationId,
    required ProductCondition? selectedCondition,
    required bool isILS,
    required List<ListingImageItem> images,
    required List<SpecificationEntry> specifications,
  }) async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    if (selectedCategoryId == null ||
        selectedLocationId == null ||
        selectedCondition == null) {
      emit(state.copyWith(errorMessage: 'Please fill in all required fields'));
      return;
    }

    emit(
      state.copyWith(
        isSubmitting: true,
        errorMessage: null,
        submitSuccess: false,
      ),
    );

    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser == null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'You must be logged in to create a listing',
        ),
      );
      return;
    }

    // Build specifications array (DB format: [{label, value, isCustom}])
    final specs = _buildSpecifications(specifications);

    // Map condition enum to DB value
    final conditionValue = _mapConditionToDb(selectedCondition);

    // Build listing data
    final listingData = <String, dynamic>{
      'seller_id': currentUser.id,
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'category_id': selectedCategoryId,
      'product_condition': conditionValue,
      'price': int.tryParse(priceController.text.trim()) ?? 0,
      'currency': isILS ? 'ILS' : 'USD',
      'location_id': selectedLocationId,
      'specifications': specs,
      'content_status': 'published',
    };

    // Step 1: Create the listing
    final createResult = await _repo.createListing(listingData);

    switch (createResult) {
      case Success(data: final listing):
        final listingId = listing['listing_id'] as String;
        final newFiles = images
            .whereType<NewImage>()
            .map((e) => e.file)
            .toList();
        await _handleImageUpload(
          listingId: listingId,
          sellerId: currentUser.id,
          images: newFiles,
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: error.message ?? 'Failed to create listing',
          ),
        );
    }
  }

  /// Save listing as a draft (only title is required)
  Future<void> saveDraft({
    required String? selectedCategoryId,
    required String? selectedLocationId,
    required ProductCondition? selectedCondition,
    required bool isILS,
    required List<ListingImageItem> images,
    required List<SpecificationEntry> specifications,
  }) async {
    if (!formKey.currentState!.validate()) return;

    emit(
      state.copyWith(
        isSubmitting: true,
        errorMessage: null,
        submitSuccess: false,
        draftSaved: false,
      ),
    );

    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser == null) {
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: 'You must be logged in to save a draft',
        ),
      );
      return;
    }

    final specs = selectedCategoryId != null
        ? _buildSpecifications(specifications)
        : <Map<String, dynamic>>[];

    final listingData = <String, dynamic>{
      'seller_id': currentUser.id,
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'content_status': 'draft',
      if (selectedCategoryId != null) 'category_id': selectedCategoryId,
      if (selectedCondition != null)
        'product_condition': _mapConditionToDb(selectedCondition),
      if (priceController.text.trim().isNotEmpty)
        'price': int.tryParse(priceController.text.trim()) ?? 0,
      'currency': isILS ? 'ILS' : 'USD',
      if (selectedLocationId != null) 'location_id': selectedLocationId,
      if (specs.isNotEmpty) 'specifications': specs,
    };

    final createResult = await _repo.createListing(listingData);

    switch (createResult) {
      case Success(data: final listing):
        final listingId = listing['listing_id'] as String;
        final newFiles = images.whereType<NewImage>().map((e) => e.file).toList();
        if (newFiles.isEmpty) {
          emit(state.copyWith(isSubmitting: false, draftSaved: true));
          return;
        }
        await _handleDraftImageUpload(
          listingId: listingId,
          sellerId: currentUser.id,
          images: newFiles,
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: error.message ?? 'Failed to save draft',
          ),
        );
    }
  }

  Future<void> _handleDraftImageUpload({
    required String listingId,
    required String sellerId,
    required List<File> images,
  }) async {
    final compressedImages = await ImageCompressHelper.compressMultipleToWebp(
      images,
      quality: 80,
      maxWidth: 1080,
      maxHeight: 1080,
    );

    final uploadResult = await _repo.uploadImages(
      sellerId: sellerId,
      listingId: listingId,
      images: compressedImages,
    );

    switch (uploadResult) {
      case Success(data: final imageUrls):
        await _repo.saveListingImages(listingId: listingId, imageUrls: imageUrls);
        emit(state.copyWith(isSubmitting: false, draftSaved: true));
      case Failure(error: final error):
        emit(
          state.copyWith(
            isSubmitting: false,
            draftSaved: true,
            errorMessage: error.message,
          ),
        );
    }
  }

  /// Update an existing listing
  Future<void> updateListing({
    required String? selectedCategoryId,
    required String? selectedLocationId,
    required ProductCondition? selectedCondition,
    required bool isILS,
    required List<ListingImageItem> images,
    required List<SpecificationEntry> specifications,
    bool publish = false,
  }) async {
    final listing = _existingListing;
    if (listing == null) return;

    if (!formKey.currentState!.validate()) return;

    if (selectedCategoryId == null ||
        selectedLocationId == null ||
        selectedCondition == null) {
      emit(state.copyWith(errorMessage: 'Please fill in all required fields'));
      return;
    }

    emit(
      state.copyWith(
        isSubmitting: true,
        errorMessage: null,
        submitSuccess: false,
      ),
    );

    final specs = _buildSpecifications(specifications);
    final conditionValue = _mapConditionToDb(selectedCondition);

    final updateData = <String, dynamic>{
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'category_id': selectedCategoryId,
      'product_condition': conditionValue,
      'price': int.tryParse(priceController.text.trim()) ?? 0,
      'currency': isILS ? 'ILS' : 'USD',
      'location_id': selectedLocationId,
      'specifications': specs,
      if (publish) 'content_status': 'published',
    };

    final updateResult = await _repo.updateListing(
      listingId: listing.listingId,
      data: updateData,
    );

    switch (updateResult) {
      case Success():
        await _handleImageUpdate(
          listingId: listing.listingId,
          sellerId: listing.sellerId,
          images: images,
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: error.message ?? 'Failed to update listing',
          ),
        );
    }
  }

  /// Handle image update: compare old vs new, re-upload if changed
  Future<void> _handleImageUpdate({
    required String listingId,
    required String sellerId,
    required List<ListingImageItem> images,
  }) async {
    final hasNewImages = images.any((i) => i is NewImage);
    final existingUrls = images
        .whereType<ExistingImage>()
        .map((e) => e.url)
        .toList();
    final originalUrls = _existingListing?.imageUrls ?? [];

    final imagesChanged = hasNewImages ||
        existingUrls.length != originalUrls.length ||
        !_listsEqual(existingUrls, originalUrls);

    if (!imagesChanged) {
      emit(state.copyWith(isSubmitting: false, submitSuccess: true));
      return;
    }

    // Delete old image records and storage files
    await _repo.deleteListingImages(listingId);
    await _repo.deleteStorageImages(sellerId: sellerId, listingId: listingId);

    // Upload new files and collect all URLs in order
    final allUrls = <String>[];

    for (final image in images) {
      switch (image) {
        case ExistingImage(:final url):
          allUrls.add(url);
        case NewImage(:final file):
          final compressedFile = await ImageCompressHelper.compressToWebp(
            file,
            quality: 80,
            maxWidth: 1080,
            maxHeight: 1080,
          );
          final uploadResult = await _repo.uploadImages(
            sellerId: sellerId,
            listingId: listingId,
            images: [compressedFile],
          );
          switch (uploadResult) {
            case Success(data: final urls):
              allUrls.addAll(urls);
            case Failure(error: final error):
              emit(
                state.copyWith(
                  isSubmitting: false,
                  submitSuccess: true,
                  errorMessage: error.message,
                ),
              );
              return;
          }
      }
    }

    if (allUrls.isNotEmpty) {
      await _handleSaveImageRecords(
        listingId: listingId,
        imageUrls: allUrls,
      );
    } else {
      emit(state.copyWith(isSubmitting: false, submitSuccess: true));
    }
  }

  /// Handle image upload after listing creation
  Future<void> _handleImageUpload({
    required String listingId,
    required String sellerId,
    required List<File> images,
  }) async {
    if (images.isEmpty) {
      emit(state.copyWith(isSubmitting: false, submitSuccess: true));
      return;
    }

    final compressedImages = await ImageCompressHelper.compressMultipleToWebp(
      images,
      quality: 80,
      maxWidth: 1080,
      maxHeight: 1080,
    );

    final uploadResult = await _repo.uploadImages(
      sellerId: sellerId,
      listingId: listingId,
      images: compressedImages,
    );

    switch (uploadResult) {
      case Success(data: final imageUrls):
        await _handleSaveImageRecords(
          listingId: listingId,
          imageUrls: imageUrls,
        );
      case Failure(error: final error):
        // Listing created but image upload failed
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: true,
            errorMessage: error.message,
          ),
        );
    }
  }

  /// Save image records to DB after upload
  Future<void> _handleSaveImageRecords({
    required String listingId,
    required List<String> imageUrls,
  }) async {
    final saveResult = await _repo.saveListingImages(
      listingId: listingId,
      imageUrls: imageUrls,
    );

    switch (saveResult) {
      case Success():
        emit(state.copyWith(isSubmitting: false, submitSuccess: true));
      case Failure(error: final error):
        // Listing created but image records failed
        emit(
          state.copyWith(
            isSubmitting: false,
            submitSuccess: true,
            errorMessage: error.message,
          ),
        );
    }
  }

  List<Map<String, dynamic>> _buildSpecifications(
    List<SpecificationEntry> specifications,
  ) {
    final specs = <Map<String, dynamic>>[];
    for (final spec in specifications) {
      final label = spec.nameController.text.trim();
      final value = spec.valueController.text.trim();
      if (label.isNotEmpty && value.isNotEmpty) {
        specs.add({'label': label, 'value': value, 'isCustom': true});
      }
    }
    return specs;
  }

  String _mapConditionToDb(ProductCondition condition) {
    return switch (condition) {
      ProductCondition.brandNew => 'brand_new',
      ProductCondition.usedExcellent => 'used_excellent',
      ProductCondition.usedGood => 'used_good',
      ProductCondition.forParts => 'for_parts',
    };
  }

  bool _listsEqual(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  Future<void> close() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
