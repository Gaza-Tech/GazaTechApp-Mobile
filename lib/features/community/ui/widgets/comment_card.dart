import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class CommentCard extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String text;
  final int likes;
  final bool isLiked;
  final int indentLevel;
  final VoidCallback? onReply;
  final VoidCallback? onLikeTap;

  const CommentCard({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.text,
    required this.likes,
    this.isLiked = false,
    this.indentLevel = 0,
    this.onReply,
    this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsetsDirectional.only(start: indentLevel * 40.w),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              child: Icon(
                Icons.person,
                size: 18.sp,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(theme),
                  SizedBox(height: 4.h),
                  Text(
                    text,
                    style: MyTextStyle.body.s.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  _buildActions(context, theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        Text(
          userName,
          style: MyTextStyle.action.m.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          timeAgo,
          style: MyTextStyle.body.xs.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        GestureDetector(
          onTap: onLikeTap,
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            size: 16.sp,
            color: isLiked
                ? theme.colorScheme.error
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          '$likes',
          style: MyTextStyle.body.xs.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: onReply,
          child: Text(
            context.l10n.reply,
            style: MyTextStyle.action.s.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
