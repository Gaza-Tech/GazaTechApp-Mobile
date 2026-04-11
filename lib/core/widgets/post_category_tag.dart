import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/community/ui/helpers/community_tag_helper.dart';

class PostCategoryTag extends StatelessWidget {
  const PostCategoryTag({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final color = CommunityTagHelper.getColor(context, category);
    final label = CommunityTagHelper.getLabel(context, category);

    return Chip(
      label: Text(label),
      backgroundColor: color.withValues(alpha: 0.15),
      labelStyle: MyTextStyle.body.s.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
    );
  }
}
