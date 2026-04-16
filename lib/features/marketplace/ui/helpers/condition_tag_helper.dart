import 'package:flutter/material.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';

class ConditionTagHelper {
  static String getLabel(BuildContext context, String condition) {
    final l10n = AppLocalizations.of(context);
    switch (condition.toLowerCase()) {
      case 'brand_new':
        return l10n.conditionBrandNew;
      case 'used_excellent':
        return l10n.conditionUsedExcellent;
      case 'used_good':
        return l10n.conditionUsedGood;
      case 'for_parts':
        return l10n.conditionForParts;
      default:
        return condition;
    }
  }

  static Color getColor(BuildContext context, String condition) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (condition.toLowerCase()) {
      case 'brand_new':
        return isDark ? MyColors.primary.onDark : MyColors.primary.base;
      case 'used_excellent':
        return isDark
            ? MyColors.status.success.onDark
            : MyColors.status.success.main;
      case 'used_good':
        return isDark
            ? MyColors.status.warning.onDark
            : MyColors.status.warning.main;
      case 'for_parts':
        return isDark
            ? MyColors.status.error.onDark
            : MyColors.status.error.main;
      default:
        return isDark ? MyColors.primary.onDark : MyColors.primary.base;
    }
  }
}
