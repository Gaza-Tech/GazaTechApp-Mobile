import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerGrid extends StatefulWidget {
  final List<File> images;
  final int maxImages;
  final ValueChanged<List<File>> onImagesChanged;

  const ImagePickerGrid({
    super.key,
    required this.images,
    required this.maxImages,
    required this.onImagesChanged,
  });

  @override
  State<ImagePickerGrid> createState() => _ImagePickerGridState();
}

class _ImagePickerGridState extends State<ImagePickerGrid> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    if (widget.images.length >= widget.maxImages) return;

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final updated = [...widget.images, File(image.path)];
      widget.onImagesChanged(updated);
    }
  }

  void _removeImage(int index) {
    final updated = [...widget.images]..removeAt(index);
    widget.onImagesChanged(updated);
  }

  void _onReorder(int oldIndex, int newIndex) {
    final updated = [...widget.images];
    final image = updated.removeAt(oldIndex);
    if (newIndex > oldIndex) newIndex--;
    updated.insert(newIndex, image);
    widget.onImagesChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(widget.maxImages, (index) {
      if (index < widget.images.length) {
        return _buildImageSlot(index);
      } else if (index == widget.images.length) {
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
    final borderColor = Theme.of(context).dividerColor;
    final contentColor = Theme.of(context).textTheme.bodySmall?.color;
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_rounded, size: 32.sp, color: contentColor),
              const VerticalSpace(4),
              Text(
                context.l10n.addMainImage,
                style: MyTextStyle.caption.m.copyWith(color: contentColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptySlot() {
    final borderColor = Theme.of(context).dividerColor;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Center(
        child: Icon(
          Icons.add,
          size: 28.sp,
          color: Theme.of(context).iconTheme.color,
        ),
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
            widget.images[index],
            width: 100.w,
            height: 100.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
      childWhenDragging: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Theme.of(context).dividerColor, width: 1.5),
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
                  widget.images[index],
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
