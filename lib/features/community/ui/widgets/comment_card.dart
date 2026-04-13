import 'package:cached_network_image/cached_network_image.dart';
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
  final bool isReported;
  final bool isEdited;
  final int indentLevel;
  final String? avatarUrl;
  final bool isVerified;
  final VoidCallback? onReply;
  final VoidCallback? onLikeTap;
  final VoidCallback? onReport;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CommentCard({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.text,
    required this.likes,
    this.isLiked = false,
    this.isReported = false,
    this.isEdited = false,
    this.indentLevel = 0,
    this.avatarUrl,
    this.isVerified = false,
    this.onReply,
    this.onLikeTap,
    this.onReport,
    this.onEdit,
    this.onDelete,
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
              child: ClipOval(
                child: avatarUrl != null
                    ? CachedNetworkImage(
                        imageUrl: avatarUrl!,
                        width: 36.r,
                        height: 36.r,
                        fit: BoxFit.cover,
                        errorWidget: (_, _, _) => Icon(
                          Icons.person,
                          size: 18.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    : Icon(
                        Icons.person,
                        size: 18.sp,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, theme),
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
            if (onEdit != null || onDelete != null)
              _buildOwnerMenu(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Text(
          userName,
          style: MyTextStyle.action.m.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        if (isVerified) ...[
          SizedBox(width: 4.w),
          Icon(Icons.verified, size: 14.sp, color: theme.colorScheme.primary),
        ],
        SizedBox(width: 8.w),
        Text(
          timeAgo,
          style: MyTextStyle.body.xs.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (isEdited) ...[
          SizedBox(width: 4.w),
          Text(
            context.l10n.edited,
            style: MyTextStyle.body.xs.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildOwnerMenu(BuildContext context, ThemeData theme) {
    final l10n = context.l10n;
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        size: 18.sp,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      padding: EdgeInsets.zero,
      onSelected: (value) {
        if (value == 'edit') onEdit?.call();
        if (value == 'delete') onDelete?.call();
      },
      itemBuilder: (_) => [
        if (onEdit != null)
          PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                Icon(Icons.edit_outlined, size: 18.sp),
                SizedBox(width: 8.w),
                Text(l10n.editComment),
              ],
            ),
          ),
        if (onDelete != null)
          PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(
                  Icons.delete_outlined,
                  size: 18.sp,
                  color: theme.colorScheme.error,
                ),
                SizedBox(width: 8.w),
                Text(
                  l10n.deleteComment,
                  style: TextStyle(color: theme.colorScheme.error),
                ),
              ],
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
        if (onReply != null) ...[
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
        if (onReport != null) ...[
          const Spacer(),
          GestureDetector(
            onTap: isReported ? null : onReport,
            child: Icon(
              isReported ? Icons.flag_rounded : Icons.outlined_flag_rounded,
              size: 16.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}
