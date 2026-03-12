import 'package:flutter/material.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/chip_selector.dart';
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
    final conditions = ProductCondition.values;
    final labels = [
      context.l10n.conditionNew,
      context.l10n.conditionUsed,
      context.l10n.conditionRefurbished,
    ];

    final selectedIndex = selectedCondition == null
        ? null
        : conditions.indexOf(selectedCondition!);

    return ChipSelector(
      items: labels,
      selectedIndex: selectedIndex,
      allowDeselect: true,
      onChanged: (index) {
        onConditionChanged(index == null ? null : conditions[index]);
      },
    );
  }
}
