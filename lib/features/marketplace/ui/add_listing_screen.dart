import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/selector.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/condition_selector.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/image_picker_grid.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/labeled_field.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/price_field.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/specifications_section.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

enum ProductCondition { newItem, used, refurbished }

class _AddListingScreenState extends State<AddListingScreen> {
  static const int _maxImages = 5;

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  List<File> _selectedImages = [];
  String? _selectedCategory;
  String? _selectedLocation;
  ProductCondition? _selectedCondition;
  bool _isILS = true;
  final List<SpecificationEntry> _specifications = [];

  List<String> _getCategories(BuildContext context) {
    final l10n = context.l10n;
    return [
      l10n.categoryElectronics,
      l10n.categoryClothing,
      l10n.categoryHomeGarden,
      l10n.categoryFood,
      l10n.categoryServices,
      l10n.categoryVehicles,
      l10n.categoryBooks,
      l10n.categorySports,
      l10n.categoryOther,
    ];
  }

  List<String> _getLocations(BuildContext context) {
    final l10n = context.l10n;
    return [
      l10n.locationGazaCity,
      l10n.locationJabalia,
      l10n.locationAlBureij,
      l10n.locationAlNusirat,
      l10n.locationDeirAlBalah,
      l10n.locationKhanYunis,
    ];
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    for (final spec in _specifications) {
      spec.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
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
            Text(context.l10n.titleHelper, style: theme.textTheme.bodySmall),
            const VerticalSpace(8),
            MyTextFormField(
              controller: _titleController,
              hintText: context.l10n.titleHint,
              textInputType: TextInputType.text,
            ),
            const VerticalSpace(16),

            // category
            LabeledField(label: context.l10n.categoryLabel),
            const VerticalSpace(8),
            Selector(
              selectedValue: _selectedCategory,
              items: _getCategories(context),
              hintText: context.l10n.selectCategory,
              title: context.l10n.selectCategoryTitle,
              onSelected: (category) {
                setState(() => _selectedCategory = category);
              },
            ),
            const VerticalSpace(16),

            // condition
            LabeledField(label: context.l10n.conditionLabel),
            const VerticalSpace(8),
            ConditionSelector(
              selectedCondition: _selectedCondition,
              onConditionChanged: (condition) {
                setState(() => _selectedCondition = condition);
              },
            ),
            const VerticalSpace(16),

            // price
            LabeledField(label: context.l10n.priceLabel),
            Text(context.l10n.priceHelper, style: theme.textTheme.bodySmall),
            const VerticalSpace(8),
            PriceField(
              controller: _priceController,
              isILS: _isILS,
              onCurrencyChanged: (isILS) {
                setState(() => _isILS = isILS);
              },
            ),
            const VerticalSpace(16),

            // description
            LabeledField(label: context.l10n.descriptionLabel),
            Text(
              context.l10n.descriptionHelper,
              style: theme.textTheme.bodySmall,
            ),
            const VerticalSpace(8),
            MyTextFormField(
              controller: _descriptionController,
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
                setState(() => _specifications.add(SpecificationEntry()));
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
              selectedValue: _selectedLocation,
              items: _getLocations(context),
              hintText: context.l10n.selectLocation,
              title: context.l10n.selectLocationTitle,
              onSelected: (location) {
                setState(() => _selectedLocation = location);
              },
            ),
            const VerticalSpace(24),
            MyButton(onPressed: () {}, text: context.l10n.publishListing),
          ],
        ),
      ),
    );
  }
}
