import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class CommunitySearchBar extends StatelessWidget {
  final VoidCallback? onSortTap;
  final bool hasActiveSort;

  const CommunitySearchBar({
    super.key,
    this.onSortTap,
    this.hasActiveSort = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isDark
                  ? theme.colorScheme.surfaceContainerHighest
                  : theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: theme.colorScheme.onSurfaceVariant,
                  size: 22.sp,
                ),
                SizedBox(width: 10.w),
                Text(
                  context.l10n.searchCommunity,
                  style: MyTextStyle.body.m.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),
        _SortIconButton(onTap: onSortTap, isActive: hasActiveSort),
      ],
    );
  }
}

class _SortIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isActive;

  const _SortIconButton({this.onTap, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color =
        isActive ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark
                ? theme.colorScheme.surfaceContainerHighest
                : theme.colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: IconButton(
            icon: Icon(Icons.tune_rounded, color: color, size: 22.sp),
            onPressed: onTap,
            splashRadius: 20.r,
          ),
        ),
        if (isActive)
          Positioned(
            top: 6.h,
            right: 6.w,
            child: Container(
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
