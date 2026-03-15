import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_actions.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_header.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String category;
  final String title;
  final String description;
  final int likes;
  final int comments;
  final bool isLiked;
  final bool isBookmarked;
  final VoidCallback? onLikeToggle;
  final VoidCallback? onBookmarkToggle;
  final VoidCallback? onTap;

  const PostCard({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.category,
    required this.title,
    required this.description,
    required this.likes,
    required this.comments,
    this.isLiked = false,
    this.isBookmarked = false,
    this.onLikeToggle,
    this.onBookmarkToggle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostCardHeader(
                userName: userName,
                timeAgo: timeAgo,
                category: category,
              ),
              SizedBox(height: 10.h),
              Text(
                title,
                style: MyTextStyle.heading.h4.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 6.h),
              Text(
                description,
                style: MyTextStyle.body.s.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12.h),
              PostCardActions(
                likes: likes,
                comments: comments,
                isLiked: isLiked,
                isBookmarked: isBookmarked,
                onLikeToggle: onLikeToggle,
                onBookmarkToggle: onBookmarkToggle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
