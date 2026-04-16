import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';

class DocumentPhotoPicker extends StatelessWidget {
  final String label;
  final String? imagePath;
  final VoidCallback onPickFromGallery;
  final VoidCallback onPickFromCamera;

  const DocumentPhotoPicker({
    super.key,
    required this.label,
    required this.imagePath,
    required this.onPickFromGallery,
    required this.onPickFromCamera,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => _showPickerSheet(context),
          child: Container(
            height: 140.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: imagePath != null
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
              ),
            ),
            child: imagePath != null
                ? _buildPreview(imagePath!)
                : _buildPlaceholder(context, theme),
          ),
        ),
      ],
    );
  }

  Widget _buildPreview(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.file(File(path), fit: BoxFit.cover, width: double.infinity),
    );
  }

  Widget _buildPlaceholder(BuildContext context, ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.camera_alt_outlined,
          size: 32.sp,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        SizedBox(height: 8.h),
        Text(
          context.l10n.tapToUploadPhoto,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  void _showPickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(context.l10n.gallery),
              onTap: () {
                Navigator.pop(context);
                onPickFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(context.l10n.camera),
              onTap: () {
                Navigator.pop(context);
                onPickFromCamera();
              },
            ),
          ],
        ),
      ),
    );
  }
}
