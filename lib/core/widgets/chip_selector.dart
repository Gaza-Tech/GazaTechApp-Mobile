import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class ChipSelector extends StatelessWidget {
  final List<String> items;
  final int? selectedIndex;
  final ValueChanged<int?> onChanged;

  /// If true, tapping the selected chip deselects it (emits null).
  final bool allowDeselect;

  const ChipSelector({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
    this.allowDeselect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(items.length, (index) {
        final isSelected = selectedIndex == index;
        return ChoiceChip(
          label: Text(items[index], style: MyTextStyle.body.s),
          selected: isSelected,
          onSelected: (selected) {
            if (allowDeselect) {
              onChanged(selected ? index : null);
            } else {
              onChanged(index);
            }
          },
        );
      }),
    );
  }
}
