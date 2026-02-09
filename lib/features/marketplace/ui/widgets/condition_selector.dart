import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/marketplace/ui/add_listing_screen.dart';

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
    return Row(
      children: ProductCondition.values.map((condition) {
        final isSelected = selectedCondition == condition;
        final label = switch (condition) {
          ProductCondition.newItem => 'New',
          ProductCondition.used => 'Used',
          ProductCondition.refurbished => 'Refurbished',
        };
        return Padding(
          padding: EdgeInsetsDirectional.only(end: 8.w),
          child: ChoiceChip(
            label: Text(label),
            selected: isSelected,
            selectedColor: MyColors.highlight.darkest,
            labelStyle: MyTextStyle.body.s.copyWith(
              color: isSelected ? Colors.white : null,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            side: BorderSide(
              color: isSelected
                  ? MyColors.highlight.darkest
                  : MyColors.neutral.dark.light,
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
