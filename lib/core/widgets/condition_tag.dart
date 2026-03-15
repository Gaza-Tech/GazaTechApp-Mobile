import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/marketplace/ui/helpers/condition_tag_helper.dart';

class ConditionTag extends StatelessWidget {
  final String condition;

  const ConditionTag({super.key, required this.condition});

  @override
  Widget build(BuildContext context) {
    final color = ConditionTagHelper.getColor(context, condition);
    final label = ConditionTagHelper.getLabel(context, condition);

    return Chip(
      label: Text(label),
      backgroundColor: color.withValues(alpha: 0.15),
      labelStyle: MyTextStyle.body.s.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
    );
  }
}
