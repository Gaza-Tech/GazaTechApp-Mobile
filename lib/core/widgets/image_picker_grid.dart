import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/models/image_item.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ImagePickerGrid extends StatefulWidget {
  final List<ImageItem> images;
  final int maxImages;
  final ValueChanged<List<ImageItem>> onImagesChanged;

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
      final tempDir = await getTemporaryDirectory();
      final uniqueName =
          '${DateTime.now().millisecondsSinceEpoch}_${p.basename(image.path)}';
      final stableFile = await File(
        image.path,
      ).copy(p.join(tempDir.path, uniqueName));

      final updated = [...widget.images, NewImage(stableFile)];
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
    final label = widget.images.isEmpty
        ? context.l10n.addMainImage
        : context.l10n.addPhoto;
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
                label,
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

  Widget _buildImageWidget(ImageItem item, {BoxFit fit = BoxFit.cover}) {
    return switch (item) {
      ExistingImage(:final url) => CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        placeholder: (_, _) => Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        errorWidget: (_, _, _) => Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: const Icon(Icons.image_not_supported_outlined),
        ),
      ),
      NewImage(:final file) => Image.file(
        file,
        width: double.infinity,
        height: double.infinity,
        fit: fit,
      ),
    };
  }

  Widget _buildImageSlot(int index) {
    final item = widget.images[index];
    return LongPressDraggable<int>(
      data: index,
      feedback: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12.r),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            width: 100.w,
            height: 100.w,
            child: _buildImageWidget(item),
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
                child: _buildImageWidget(item),
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
