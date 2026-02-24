import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class SpecificationsTable extends StatelessWidget {
  final List<MapEntry<String, String>> specs;

  const SpecificationsTable({super.key, required this.specs});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12.dg),
        border: Border.all(
          color: isDark
              ? MyColors.dark.outlineVariant
              : MyColors.light.outlineVariant,
        ),
      ),
      child: Column(
        children: specs.asMap().entries.map((entry) {
          final index = entry.key;
          final spec = entry.value;
          final isLast = index == specs.length - 1;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      spec.key,
                      style: MyTextStyle.body.m.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                    Text(
                      spec.value,
                      style: MyTextStyle.body.m.copyWith(
                        color: theme.textTheme.titleMedium?.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Divider(height: 1, indent: 16.w, endIndent: 16.w),
            ],
          );
        }).toList(),
      ),
    );
  }
}
