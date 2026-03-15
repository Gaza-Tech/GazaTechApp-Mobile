import 'package:flutter/material.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';

class CommunityTagHelper {
  static String getLabel(BuildContext context, String categoryKey) {
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

  static Color getColor(BuildContext context, String categoryKey) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
