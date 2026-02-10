import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
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

  static const List<String> _categories = [
    'Electronics',
    'Clothing',
    'Home & Garden',
    'Food',
    'Services',
    'Vehicles',
    'Books',
    'Sports',
    'Other',
  ];
  static const List<String> _locations = [
    'Gaza City',
    'Jabalia',
    'Al Bureij',
    'Al Nusirat',
    'Deir Al Balah',
    'Khan Yunis',
  ];

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Listing '),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: implement save draft
            },
            child: const Text('Save Draft'),
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
              'Product Images (Max $_maxImages)',
              style: MyTextStyle.heading.h3,
            ),
            Text(
              'Add clear photos of your product. First image will be the cover.',
              style: MyTextStyle.body.s.copyWith(
                color: MyColors.neutral.dark.light,
              ),
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

            Text('Product Information', style: MyTextStyle.heading.h3),
            const VerticalSpace(16),

            // title
            const LabeledField(label: 'Title'),
            Text(
              'Be specific and descriptive',
              style: MyTextStyle.body.s.copyWith(
                color: MyColors.neutral.dark.light,
              ),
            ),
            const VerticalSpace(8),
            MyTextFormField(
              controller: _titleController,
              hintText: 'e.g., iPhone 14 Pro Max 256GB Purple',
              textInputType: TextInputType.text,
            ),
            const VerticalSpace(16),

            // category
            const LabeledField(label: 'Category'),
            const VerticalSpace(8),
            Selector(
              selectedValue: _selectedCategory,
              items: _categories,
              hintText: 'Select category',
              title: 'Select Category',
              onSelected: (category) {
                setState(() => _selectedCategory = category);
              },
            ),
            const VerticalSpace(16),

            // condition
            const LabeledField(label: 'Condition'),
            const VerticalSpace(8),
            ConditionSelector(
              selectedCondition: _selectedCondition,
              onConditionChanged: (condition) {
                setState(() => _selectedCondition = condition);
              },
            ),
            const VerticalSpace(16),

            // price
            const LabeledField(label: 'Price'),
            Text(
              'Set a competitive price to attract buyers',
              style: MyTextStyle.body.s.copyWith(
                color: MyColors.neutral.dark.light,
              ),
            ),
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
            const LabeledField(label: 'Description'),
            Text(
              'Be honest and detailed',
              style: MyTextStyle.body.s.copyWith(
                color: MyColors.neutral.dark.light,
              ),
            ),
            const VerticalSpace(8),
            MyTextFormField(
              controller: _descriptionController,
              hintText: 'Describe your product...',
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.w,
              ),
              maxLength: 250,
              maxLines: null,
              minLines: 5,
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
            const LabeledField(label: 'Location'),
            const VerticalSpace(8),
            Selector(
              selectedValue: _selectedLocation,
              items: _locations,
              hintText: 'Select location',
              title: 'Select Location',
              onSelected: (location) {
                setState(() => _selectedLocation = location);
              },
            ),
            const VerticalSpace(24),
            MyButton(onPressed: () {}, text: 'Publish Listing'),
          ],
        ),
      ),
    );
  }
}
