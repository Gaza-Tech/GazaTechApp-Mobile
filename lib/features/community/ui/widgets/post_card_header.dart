import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class PostCardHeader extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String category;

  const PostCardHeader({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          child: Icon(
            Icons.person,
            size: 22.sp,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: MyTextStyle.action.l.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                timeAgo,
                style: MyTextStyle.body.xs.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
