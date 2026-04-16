import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/core/widgets/form_error_dismisser.dart';
import 'package:gaza_tech/features/add_listing/cubit/add_listing_cubit.dart';
import 'package:gaza_tech/features/add_listing/cubit/add_listing_state.dart';
import 'package:gaza_tech/features/add_listing/data/models/listing_image_item.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/selector.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/condition_selector.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/image_picker_grid.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/labeled_field.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/price_field.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/specifications_section.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

enum ProductCondition { brandNew, usedExcellent, usedGood, forParts }

class _AddListingScreenState extends State<AddListingScreen> {
  static const int _maxImages = 5;

  List<ListingImageItem> _selectedImages = [];
  String? _selectedCategoryId;
  String? _selectedCategoryName;
  String? _selectedLocationId;
  String? _selectedLocationName;
  ProductCondition? _selectedCondition;
  bool _isILS = true;
  final List<SpecificationEntry> _specifications = [];
  bool _editInitialized = false;

  @override
  void dispose() {
    for (final spec in _specifications) {
      spec.dispose();
    }
    super.dispose();
  }

  String _localizedName(String name, String? nameAr, bool isArabic) =>
      isArabic ? (nameAr ?? name) : name;

  void _initializeEditData(BuildContext context, AddListingCubit cubit) {
    if (_editInitialized) return;
    _editInitialized = true;

    final editData = cubit.initializeForEdit();
    if (editData == null) return;

    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final catName = editData.categoryName;
    final locName = editData.locationName;

    setState(() {
      _selectedCategoryId = editData.categoryId;
      _selectedCategoryName = catName != null
          ? _localizedName(catName, editData.categoryNameAr, isArabic)
          : null;
      _selectedLocationId = editData.locationId;
      _selectedLocationName = locName != null
          ? _localizedName(locName, editData.locationNameAr, isArabic)
          : null;
      _selectedCondition = editData.condition;
      _isILS = editData.isILS;
      _selectedImages = editData.images;
      _specifications.addAll(editData.specifications);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<AddListingCubit>();

    return MultiBlocListener(
      listeners: [
        BlocListener<AddListingCubit, AddListingState>(
          listenWhen: (prev, curr) =>
              prev.isLoadingFormData && !curr.isLoadingFormData,
          listener: (context, state) {
            if (state.isEditMode) {
              _initializeEditData(context, cubit);
            }
          },
        ),
        BlocListener<AddListingCubit, AddListingState>(
          listenWhen: (prev, curr) =>
              prev.submitSuccess != curr.submitSuccess ||
              prev.draftSaved != curr.draftSaved ||
              prev.errorMessage != curr.errorMessage,
          listener: (context, state) {
            if (state.submitSuccess) {
              final message = state.isEditMode
                  ? context.l10n.listingUpdated
                  : context.l10n.publishListing;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
              Navigator.pop(context, true);
            }
            if (state.draftSaved) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(context.l10n.draftSaved)));
              Navigator.pop(context, true);
            }
            if (state.errorMessage != null && !state.isSubmitting) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },
        ),
      ],
      child: BlocBuilder<AddListingCubit, AddListingState>(
        builder: (context, state) {
          final isArabic = Localizations.localeOf(context).languageCode == 'ar';

          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    state.isEditMode
                        ? context.l10n.editListing
                        : context.l10n.addListing,
                  ),
                  actions: [
                    if (!state.isEditMode || cubit.isDraftEdit)
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 8.w),
                        child: TextButton(
                          onPressed: state.isSubmitting
                              ? null
                              : () {
                                  if (cubit.isDraftEdit) {
                                    cubit.updateListing(
                                      selectedCategoryId: _selectedCategoryId,
                                      selectedLocationId: _selectedLocationId,
                                      selectedCondition: _selectedCondition,
                                      isILS: _isILS,
                                      images: _selectedImages,
                                      specifications: _specifications,
                                    );
                                  } else {
                                    cubit.saveDraft(
                                      selectedCategoryId: _selectedCategoryId,
                                      selectedLocationId: _selectedLocationId,
                                      selectedCondition: _selectedCondition,
                                      isILS: _isILS,
                                      images: _selectedImages,
                                      specifications: _specifications,
                                    );
                                  }
                                },
                          child: Text(
                            cubit.isDraftEdit
                                ? context.l10n.saveEdit
                                : context.l10n.saveDraft,
                          ),
                        ),
                      ),
                  ],
                ),
                body: state.isLoadingFormData
                    ? const Center(child: CircularProgressIndicator())
                    : FormErrorDismisser(
                        onDismiss: () => cubit.clearFormErrors(),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(16.w),
                          child: Form(
                            key: cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // images
                                Text(
                                  context.l10n.productImagesMax(_maxImages),
                                  style: theme.textTheme.titleMedium,
                                ),
                                Text(
                                  context.l10n.productImagesHelper,
                                  style: theme.textTheme.bodySmall,
                                ),
                                const VerticalSpace(12),
                                ImagePickerGrid(
                                  images: _selectedImages,
                                  maxImages: _maxImages,
                                  onImagesChanged: (images) {
                                    setState(() => _selectedImages = images);
                                  },
                                ),
                                const VerticalSpace(8),

                                Text(
                                  context.l10n.productInformation,
                                  style: theme.textTheme.titleMedium,
                                ),
                                const VerticalSpace(16),

                                // title
                                LabeledField(label: context.l10n.titleLabel),
                                Text(
                                  context.l10n.titleHelper,
                                  style: theme.textTheme.bodySmall,
                                ),
                                const VerticalSpace(8),
                                MyTextFormField(
                                  controller: cubit.titleController,
                                  hintText: context.l10n.titleHint,
                                  textInputType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return context.l10n.titleLabel;
                                    }
                                    return null;
                                  },
                                ),
                                const VerticalSpace(16),

                                // category
                                LabeledField(label: context.l10n.categoryLabel),
                                const VerticalSpace(8),
                                Selector(
                                  selectedValue: _selectedCategoryName,
                                  items: state.categories
                                      .map(
                                        (c) => _localizedName(
                                          c.name,
                                          c.nameAr,
                                          isArabic,
                                        ),
                                      )
                                      .toList(),
                                  hintText: context.l10n.selectCategory,
                                  title: context.l10n.selectCategoryTitle,
                                  onSelected: (index) {
                                    final category = state.categories[index];
                                    setState(() {
                                      _selectedCategoryId = category.id;
                                      _selectedCategoryName = _localizedName(
                                        category.name,
                                        category.nameAr,
                                        isArabic,
                                      );
                                    });
                                  },
                                ),
                                const VerticalSpace(16),

                                // condition
                                LabeledField(
                                  label: context.l10n.conditionLabel,
                                ),
                                const VerticalSpace(8),
                                ConditionSelector(
                                  selectedCondition: _selectedCondition,
                                  onConditionChanged: (condition) {
                                    setState(
                                      () => _selectedCondition = condition,
                                    );
                                  },
                                ),
                                const VerticalSpace(16),

                                // price
                                LabeledField(label: context.l10n.priceLabel),
                                Text(
                                  context.l10n.priceHelper,
                                  style: theme.textTheme.bodySmall,
                                ),
                                const VerticalSpace(8),
                                PriceField(
                                  controller: cubit.priceController,
                                  isILS: _isILS,
                                  onCurrencyChanged: (isILS) {
                                    setState(() => _isILS = isILS);
                                  },
                                ),
                                const VerticalSpace(16),

                                // description
                                LabeledField(
                                  label: context.l10n.descriptionLabel,
                                ),
                                Text(
                                  context.l10n.descriptionHelper,
                                  style: theme.textTheme.bodySmall,
                                ),
                                const VerticalSpace(8),
                                MyTextFormField(
                                  controller: cubit.descriptionController,
                                  hintText: context.l10n.descriptionHint,
                                  textInputType: TextInputType.multiline,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 16.w,
                                  ),
                                  maxLength: 250,
                                  minLines: 11,
                                ),
                                const VerticalSpace(16),

                                // specifications
                                SpecificationsDisplay(
                                  specifications: _specifications,
                                  onAdd: () {
                                    setState(
                                      () => _specifications.add(
                                        SpecificationEntry(),
                                      ),
                                    );
                                  },
                                  onRemove: (index) {
                                    setState(() {
                                      _specifications[index].dispose();
                                      _specifications.removeAt(index);
                                    });
                                  },
                                ),
                                const VerticalSpace(16),

                                // location
                                LabeledField(label: context.l10n.locationLabel),
                                const VerticalSpace(8),
                                Selector(
                                  selectedValue: _selectedLocationName,
                                  items: state.locations
                                      .map(
                                        (l) => _localizedName(
                                          l.name,
                                          l.nameAr,
                                          isArabic,
                                        ),
                                      )
                                      .toList(),
                                  hintText: context.l10n.selectLocation,
                                  title: context.l10n.selectLocationTitle,
                                  onSelected: (index) {
                                    final location = state.locations[index];
                                    setState(() {
                                      _selectedLocationId = location.locationId;
                                      _selectedLocationName = _localizedName(
                                        location.name,
                                        location.nameAr,
                                        isArabic,
                                      );
                                    });
                                  },
                                ),
                                const VerticalSpace(24),
                                MyButton(
                                  onPressed: () {
                                    if (state.isEditMode) {
                                      cubit.updateListing(
                                        selectedCategoryId: _selectedCategoryId,
                                        selectedLocationId: _selectedLocationId,
                                        selectedCondition: _selectedCondition,
                                        isILS: _isILS,
                                        images: _selectedImages,
                                        specifications: _specifications,
                                        publish: cubit.isDraftEdit,
                                      );
                                    } else {
                                      cubit.createListing(
                                        selectedCategoryId: _selectedCategoryId,
                                        selectedLocationId: _selectedLocationId,
                                        selectedCondition: _selectedCondition,
                                        isILS: _isILS,
                                        images: _selectedImages,
                                        specifications: _specifications,
                                      );
                                    }
                                  },
                                  text: cubit.isDraftEdit
                                      ? context.l10n.publishListing
                                      : (state.isEditMode
                                            ? context.l10n.updateListing
                                            : context.l10n.publishListing),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
              // Loading overlay during submission
              if (state.isSubmitting)
                Container(
                  color: Colors.black26,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
