import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';

class CommentInputBar extends StatelessWidget {
  const CommentInputBar({
    super.key,
    required this.controller,
    this.replyingTo,
    this.onDismissReply,
    this.onSubmit,
    this.isEditing = false,
    this.onCancelEdit,
    this.isGuest = false,
  });

  final TextEditingController controller;
  final String? replyingTo;
  final VoidCallback? onDismissReply;
  final VoidCallback? onSubmit;
  final bool isEditing;
  final VoidCallback? onCancelEdit;

  /// When `true`, the input is non-interactive and visually dimmed. Tapping
  /// anywhere in the bar routes through [onSubmit] — typically a handler
  /// gated by `GuestGuard` that shows the sign-up prompt sheet.
  final bool isGuest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1.h, thickness: 1),
          if (isEditing)
            _buildEditingBanner(context, theme)
          else if (replyingTo != null)
            _buildReplyBanner(context, theme),
          if (isGuest)
            _buildGuestRow(context, theme)
          else
            _buildInputRow(context, theme),
        ],
      ),
    );
  }

  Widget _buildInputRow(BuildContext context, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
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
          SizedBox(width: 8.w),
          Expanded(
            child: MyTextFormField(
              controller: controller,
              hintText: context.l10n.addComment,
              textInputType: TextInputType.multiline,
              maxLines: 4,
              minLines: 1,
              textInputAction: TextInputAction.newline,
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 8.w,
              ),
            ),
          ),
          SizedBox(width: 4.w),
          IconButton(
            icon: Icon(
              Icons.send_rounded,
              color: theme.colorScheme.primary,
              size: 22.sp,
            ),
            onPressed: onSubmit,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.h),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestRow(BuildContext context, ThemeData theme) {
    return InkWell(
      onTap: onSubmit,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Opacity(
          opacity: 0.5,
          child: IgnorePointer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                SizedBox(width: 8.w),
                Expanded(
                  child: MyTextFormField(
                    controller: controller,
                    hintText: context.l10n.addComment,
                    textInputType: TextInputType.multiline,
                    maxLines: 4,
                    minLines: 1,
                    textInputAction: TextInputAction.newline,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 8.w,
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                IconButton(
                  icon: Icon(
                    Icons.send_rounded,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 22.sp,
                  ),
                  onPressed: null,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditingBanner(BuildContext context, ThemeData theme) {
    return Container(
      color: theme.colorScheme.surfaceContainerLow,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Row(
        children: [
          Icon(
            Icons.edit_outlined,
            size: 16.sp,
            color: theme.colorScheme.primary,
          ),
          SizedBox(width: 6.w),
          Text(
            context.l10n.editingComment,
            style: MyTextStyle.body.s.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onCancelEdit,
            child: Icon(
              Icons.close,
              size: 18.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyBanner(BuildContext context, ThemeData theme) {
    return Container(
      color: theme.colorScheme.surfaceContainerLow,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Row(
        children: [
          Icon(
            Icons.reply_rounded,
            size: 16.sp,
            color: theme.colorScheme.primary,
          ),
          SizedBox(width: 6.w),
          Text(
            context.l10n.replyingTo(replyingTo!),
            style: MyTextStyle.body.s.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onDismissReply,
            child: Icon(
              Icons.close,
              size: 18.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
