import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class ListingTags extends StatelessWidget {
  final String condition;
  final String category;

  const ListingTags({
    super.key,
    required this.condition,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          label: Text(condition),
          backgroundColor: MyColors.highlight.darkest.withValues(alpha: 0.15),
          labelStyle: MyTextStyle.body.s.copyWith(
            color: MyColors.highlight.darkest,
            fontWeight: FontWeight.w600,
          ),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
        ),
        const HorizontalSpace(8),
        Chip(
          label: Text(category),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
        ),
      ],
    );
  }
}
