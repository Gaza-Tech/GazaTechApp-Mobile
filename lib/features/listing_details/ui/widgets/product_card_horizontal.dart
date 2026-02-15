import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class ProductCardHorizontal extends StatelessWidget {
  final String name;
  final String price;
  final VoidCallback onTap;

  const ProductCardHorizontal({
    super.key,
    required this.name,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(12.dg),
          border: Border.all(
            color: isDark
                ? MyColors.neutral.light.lightest.withValues(alpha: 0.05)
                : MyColors.neutral.light.medium,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110.h,
              decoration: BoxDecoration(
                color: MyColors.neutral.dark.medium,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.dg),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.laptop_mac,
                  size: 40.sp,
                  color: Colors.white54,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: MyTextStyle.body.s.copyWith(
                      color: theme.textTheme.titleMedium?.color,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const VerticalSpace(4),
                  Text(
                    price,
                    style: MyTextStyle.heading.h5.copyWith(
                      color: MyColors.highlight.darkest,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
