import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/add_listing/ui/add_listing_screen.dart';

class ConditionSelector extends StatelessWidget {
  final ProductCondition? selectedCondition;
  final ValueChanged<ProductCondition?> onConditionChanged;

  const ConditionSelector({
    super.key,
    required this.selectedCondition,
    required this.onConditionChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: ProductCondition.values.map((condition) {
        final isSelected = selectedCondition == condition;
        final label = switch (condition) {
          ProductCondition.newItem => context.l10n.conditionNew,
          ProductCondition.used => context.l10n.conditionUsed,
          ProductCondition.refurbished => context.l10n.conditionRefurbished,
        };
        return Padding(
          padding: EdgeInsetsDirectional.only(end: 8.w),
          child: ChoiceChip(
            label: Text(label),
            selected: isSelected,
            selectedColor: theme.colorScheme.primary,
            labelStyle: MyTextStyle.body.s.copyWith(
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.textTheme.bodySmall?.color,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            side: BorderSide(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline,
            ),
            onSelected: (selected) {
              onConditionChanged(selected ? condition : null);
            },
          ),
        );
      }).toList(),
    );
  }
}
