import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostImageGallery extends StatelessWidget {
  final int imageCount;

  const PostImageGallery({super.key, this.imageCount = 2});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 180.h,
      child: Row(
        children: List.generate(imageCount, (index) {
          return Expanded(
            child: Container(
              margin: EdgeInsetsDirectional.only(
                end: index < imageCount - 1 ? 8.w : 0,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 48.sp,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
