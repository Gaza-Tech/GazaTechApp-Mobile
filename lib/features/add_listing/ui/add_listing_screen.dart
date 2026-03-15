import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/add_listing/cubit/add_listing_cubit.dart';
import 'package:gaza_tech/features/add_listing/cubit/add_listing_state.dart';
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

  List<File> _selectedImages = [];
  String? _selectedCategoryId;
  String? _selectedCategoryName;
  String? _selectedLocationId;
  String? _selectedLocationName;
  ProductCondition? _selectedCondition;
  bool _isILS = true;
  final List<SpecificationEntry> _specifications = [];

  @override
  void dispose() {
    for (final spec in _specifications) {
      spec.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<AddListingCubit>();

    return BlocListener<AddListingCubit, AddListingState>(
      listener: (context, state) {
        if (state.submitSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.l10n.publishListing)));
          context.pop();
        }
        if (state.errorMessage != null && !state.isSubmitting) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      child: BlocBuilder<AddListingCubit, AddListingState>(
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(context.l10n.addListing),
                  actions: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 8.w),
                      child: TextButton(
                        onPressed: () {
                          // TODO: implement save draft
                        },
                        child: Text(context.l10n.saveDraft),
                      ),
                    ),
                  ],
                ),
                body: state.isLoadingFormData
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
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
                                    .map((c) => c.name)
                                    .toList(),
                                hintText: context.l10n.selectCategory,
                                title: context.l10n.selectCategoryTitle,
                                onSelected: (categoryName) {
                                  final category = state.categories.firstWhere(
                                    (c) => c.name == categoryName,
                                  );
                                  setState(() {
                                    _selectedCategoryId = category.id;
                                    _selectedCategoryName = categoryName;
                                  });
                                },
                              ),
                              const VerticalSpace(16),

                              // condition
                              LabeledField(label: context.l10n.conditionLabel),
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
                                    .map((l) => l.name)
                                    .toList(),
                                hintText: context.l10n.selectLocation,
                                title: context.l10n.selectLocationTitle,
                                onSelected: (locationName) {
                                  final location = state.locations.firstWhere(
                                    (l) => l.name == locationName,
                                  );
                                  setState(() {
                                    _selectedLocationId = location.locationId;
                                    _selectedLocationName = locationName;
                                  });
                                },
                              ),
                              const VerticalSpace(24),
                              MyButton(
                                onPressed: () {
                                  cubit.createListing(
                                    selectedCategoryId: _selectedCategoryId,
                                    selectedLocationId: _selectedLocationId,
                                    selectedCondition: _selectedCondition,
                                    isILS: _isILS,
                                    images: _selectedImages,
                                    specifications: _specifications,
                                  );
                                },
                                text: context.l10n.publishListing,
                              ),
                            ],
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
