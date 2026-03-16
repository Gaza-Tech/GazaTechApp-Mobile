import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class ViewRepliesButton extends StatelessWidget {
  final int repliesCount;
  final bool isExpanded;
  final bool isLoading;
  final VoidCallback onTap;

  const ViewRepliesButton({
    super.key,
    required this.repliesCount,
    required this.isExpanded,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsetsDirectional.only(start: 46.w, bottom: 4.h),
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: Row(
          children: [
            SizedBox(
              width: 24.w,
              child: Divider(
                color: theme.colorScheme.primary,
                thickness: 1,
              ),
            ),
            SizedBox(width: 8.w),
            if (isLoading)
              SizedBox(
                width: 12.w,
                height: 12.w,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: theme.colorScheme.primary,
                ),
              )
            else
              Text(
                isExpanded
                    ? l10n.hideReplies
                    : l10n.viewReplies(repliesCount),
                style: MyTextStyle.action.s.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
