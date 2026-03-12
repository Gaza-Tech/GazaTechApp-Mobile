import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class CategoryTag extends StatelessWidget {
  final String categoryKey;

  const CategoryTag({super.key, required this.categoryKey});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final tagColor = _getColor(isDark);
    final displayName = _getDisplayName(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: tagColor.withAlpha(30),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: tagColor.withAlpha(80)),
      ),
      child: Text(
        displayName,
        style: MyTextStyle.caption.m.copyWith(color: tagColor),
      ),
    );
  }

  String _getDisplayName(BuildContext context) {
    final l10n = context.l10n;
    switch (categoryKey) {
      case 'question':
        return l10n.question;
      case 'tips':
        return l10n.tips;
      case 'news':
        return l10n.news;
      case 'troubleshooting':
        return l10n.troubleshooting;
      default:
        return categoryKey;
    }
  }

  Color _getColor(bool isDark) {
    switch (categoryKey) {
      case 'question':
        return isDark ? MyColors.primary.onDark : MyColors.primary.base;
      case 'tips':
        return isDark
            ? MyColors.status.success.onDark
            : MyColors.status.success.main;
      case 'news':
        return isDark
            ? MyColors.status.warning.onDark
            : MyColors.status.warning.main;
      case 'troubleshooting':
        return isDark
            ? MyColors.status.error.onDark
            : MyColors.status.error.main;
      default:
        return isDark ? MyColors.primary.onDark : MyColors.primary.base;
    }
  }
}
