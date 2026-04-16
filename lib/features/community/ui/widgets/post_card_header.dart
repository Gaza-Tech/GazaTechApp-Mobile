import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/post_category_tag.dart';

class PostCardHeader extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String category;
  final String? avatarUrl;
  final bool isVerified;
  final VoidCallback? onAuthorTap;

  const PostCardHeader({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.category,
    this.avatarUrl,
    this.isVerified = false,
    this.onAuthorTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        GestureDetector(
          onTap: onAuthorTap,
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            child: ClipOval(
              child: avatarUrl != null
                  ? CachedNetworkImage(
                      imageUrl: avatarUrl!,
                      width: 40.r,
                      height: 40.r,
                      fit: BoxFit.cover,
                      errorWidget: (_, _, _) => _buildIcon(theme),
                    )
                  : _buildIcon(theme),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: onAuthorTap,
                      child: Text(
                        userName,
                        style: MyTextStyle.action.l.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  if (isVerified) ...[
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.verified,
                      size: 16.sp,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ],
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
        PostCategoryTag(category: category),
      ],
    );
  }

  Widget _buildIcon(ThemeData theme) {
    return SizedBox(
      width: 40.r,
      height: 40.r,
      child: Icon(
        Icons.person,
        size: 22.sp,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
