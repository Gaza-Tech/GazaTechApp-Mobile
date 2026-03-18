import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class ActiveFiltersBar extends StatelessWidget {
  final List<({String label, VoidCallback onRemove})> chips;

  const ActiveFiltersBar({super.key, required this.chips});

  @override
  Widget build(BuildContext context) {
    if (chips.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: chips
              .map(
                (chip) => Chip(
                  label: Text(chip.label, style: MyTextStyle.body.xs),
                  deleteIcon: const Icon(Icons.close),
                  onDeleted: chip.onRemove,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
