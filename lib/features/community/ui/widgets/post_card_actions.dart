import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_action_button.dart';

class PostCardActions extends StatelessWidget {
  final int likes;
  final int comments;
  final bool isLiked;
  final bool isBookmarked;
  final VoidCallback? onLikeToggle;
  final VoidCallback? onBookmarkToggle;

  const PostCardActions({
    super.key,
    required this.likes,
    required this.comments,
    this.isLiked = false,
    this.isBookmarked = false,
    this.onLikeToggle,
    this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final activeColor =
        isDark ? MyColors.status.error.onDark : MyColors.status.error.main;
    final bookmarkColor = theme.colorScheme.primary;
    final inactiveColor = theme.colorScheme.onSurfaceVariant;

    return Row(
      children: [
        PostActionButton(
          icon: isLiked ? Icons.favorite : Icons.favorite_border,
          label: '$likes',
          color: isLiked ? activeColor : inactiveColor,
          onTap: onLikeToggle,
        ),
        SizedBox(width: 16.w),
        PostActionButton(
          icon: Icons.chat_bubble_outline,
          label: '$comments',
          color: inactiveColor,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_outlined, size: 20.sp),
          color: inactiveColor,
          constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.h),
          padding: EdgeInsets.zero,
        ),
        IconButton(
          onPressed: onBookmarkToggle,
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            size: 20.sp,
          ),
          color: isBookmarked ? bookmarkColor : inactiveColor,
          constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.h),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
