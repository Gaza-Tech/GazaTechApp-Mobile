import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/add_listing/data/repos/add_listing_repo.dart';
import 'package:gaza_tech/features/add_listing/ui/add_listing_screen.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/specifications_section.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'add_listing_state.dart';

class AddListingCubit extends Cubit<AddListingState> {
  final AddListingRepo _repo;

  AddListingCubit(this._repo) : super(const AddListingState());

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

    emit(state.copyWith(
      categories: categories,
      locations: locations,
      isLoadingFormData: false,
      errorMessage: error,
    ));
  }

  /// Create a listing with all form data
  Future<void> createListing({
    required String? selectedCategoryId,
    required String? selectedLocationId,
    required ProductCondition? selectedCondition,
    required bool isILS,
    required List<File> images,
    required List<SpecificationEntry> specifications,
  }) async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    if (selectedCategoryId == null ||
        selectedLocationId == null ||
        selectedCondition == null) {
      emit(state.copyWith(
        errorMessage: 'Please fill in all required fields',
      ));
      return;
    }

    emit(state.copyWith(
        isSubmitting: true, errorMessage: null, submitSuccess: false));

    final currentUser = Supabase.instance.client.auth.currentUser;
    if (currentUser == null) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: 'You must be logged in to create a listing',
      ));
      return;
    }

    // Build specifications array (DB format: [{label, value, isCustom}])
    final specs = <Map<String, dynamic>>[];
    for (final spec in specifications) {
      final label = spec.nameController.text.trim();
      final value = spec.valueController.text.trim();
      if (label.isNotEmpty && value.isNotEmpty) {
        specs.add({'label': label, 'value': value, 'isCustom': true});
      }
    }

    // Map condition enum to DB value
    final conditionValue = switch (selectedCondition) {
      ProductCondition.newItem => 'new',
      ProductCondition.used => 'used',
      ProductCondition.refurbished => 'refurbished',
    };

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
        await _handleImageUpload(
          listingId: listingId,
          sellerId: currentUser.id,
          images: images,
        );
      case Failure(error: final error):
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: error.message ?? 'Failed to create listing',
        ));
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

    final uploadResult = await _repo.uploadImages(
      sellerId: sellerId,
      listingId: listingId,
      images: images,
    );

    switch (uploadResult) {
      case Success(data: final imageUrls):
        await _handleSaveImageRecords(listingId: listingId, imageUrls: imageUrls);
      case Failure(error: final error):
        // Listing created but image upload failed
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
          errorMessage: error.message,
        ));
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
        emit(state.copyWith(
          isSubmitting: false,
          submitSuccess: true,
          errorMessage: error.message,
        ));
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
