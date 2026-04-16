import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostImageGallery extends StatelessWidget {
  final List<String> imageUrls;
  final void Function(int index)? onImageTap;

  const PostImageGallery({super.key, required this.imageUrls, this.onImageTap});

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) return const SizedBox.shrink();

    return switch (imageUrls.length) {
      1 => _buildSingle(context),
      2 => _buildTwo(context),
      3 => _buildThree(context),
      _ => _buildGrid(context),
    };
  }

  Widget _buildSingle(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: _buildImage(context, 0),
    );
  }

  Widget _buildTwo(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Row(
        children: [
          Expanded(child: _buildImage(context, 0)),
          SizedBox(width: 6.w),
          Expanded(child: _buildImage(context, 1)),
        ],
      ),
    );
  }

  Widget _buildThree(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Row(
        children: [
          Expanded(flex: 2, child: _buildImage(context, 0)),
          SizedBox(width: 6.w),
          Expanded(
            child: Column(
              children: [
                Expanded(child: _buildImage(context, 1)),
                SizedBox(height: 6.h),
                Expanded(child: _buildImage(context, 2)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildImage(context, 0)),
                SizedBox(width: 6.w),
                Expanded(child: _buildImage(context, 1)),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildImage(context, 2)),
                SizedBox(width: 6.w),
                Expanded(child: _buildImage(context, 3)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, int index) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onImageTap != null ? () => onImageTap!(index) : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: CachedNetworkImage(
          imageUrl: imageUrls[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          placeholder: (_, _) => Container(
            color: theme.colorScheme.surfaceContainerHighest,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          errorWidget: (_, _, _) => Container(
            color: theme.colorScheme.surfaceContainerHighest,
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 32.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
