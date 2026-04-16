import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/post_category_tag.dart';

class RelatedPostCard extends StatelessWidget {
  final String title;
  final String category;
  final int likes;
  final int comments;

  const RelatedPostCard({
    super.key,
    required this.title,
    required this.category,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Container(
              width: 72.w,
              height: 72.w,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 28.sp,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MyTextStyle.action.l.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  PostCategoryTag(category: category),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 14.sp,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '$likes',
                        style: MyTextStyle.body.xs.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 14.sp,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '$comments',
                        style: MyTextStyle.body.xs.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
