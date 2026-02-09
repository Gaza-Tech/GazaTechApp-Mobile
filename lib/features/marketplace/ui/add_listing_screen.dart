import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  static const int _maxImages = 5;
  final List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    if (_selectedImages.length >= _maxImages) return;

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImages.add(File(image.path));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final image = _selectedImages.removeAt(oldIndex);
      if (newIndex > oldIndex) newIndex--;
      _selectedImages.insert(newIndex, image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Listing '),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: implement save darft
            },
            child: const Text('Save Draft'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Images (Max $_maxImages)',
              style: MyTextStyle.heading.h3,
            ),
            const VerticalSpace(12),
            _buildImageGrid(),
            Text(
              'Drag to reorder images',
              style: MyTextStyle.body.s.copyWith(
                color: MyColors.neutral.dark.light,
              ),
            ),
            const VerticalSpace(24),
            Text('Product Information', style: MyTextStyle.heading.h3),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
    final totalSlots = _maxImages;
    final items = List.generate(totalSlots, (index) {
      if (index < _selectedImages.length) {
        return _buildImageSlot(index);
      } else if (index == _selectedImages.length) {
        return _buildAddPhotoSlot();
      } else {
        return _buildEmptySlot();
      }
    });

    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10.w,
      crossAxisSpacing: 10.w,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: items,
    );
  }

  Widget _buildAddPhotoSlot() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: MyColors.neutral.dark.light, width: 1.5),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_rounded,
                size: 32.sp,
                color: MyColors.neutral.dark.light,
              ),
              const VerticalSpace(4),
              Text(
                'Add Main Image',
                style: MyTextStyle.caption.m.copyWith(
                  color: MyColors.neutral.dark.light,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptySlot() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.neutral.dark.light, width: 1.5),
      ),
      child: Center(
        child: Icon(Icons.add, size: 28.sp, color: MyColors.neutral.dark.light),
      ),
    );
  }

  Widget _buildImageSlot(int index) {
    return LongPressDraggable<int>(
      data: index,
      feedback: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12.r),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.file(
            _selectedImages[index],
            width: 100.w,
            height: 100.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
      childWhenDragging: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: MyColors.neutral.dark.light, width: 1.5),
        ),
      ),
      child: DragTarget<int>(
        onAcceptWithDetails: (details) => _onReorder(details.data, index),
        builder: (context, candidateData, rejectedData) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  _selectedImages[index],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4.w,
                right: 4.w,
                child: GestureDetector(
                  onTap: () => _removeImage(index),
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, size: 16.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
