import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class ProductCardHorizontal extends StatelessWidget {
  final String name;
  final String price;
  final String? imageUrl;
  final VoidCallback onTap;

  const ProductCardHorizontal({
    super.key,
    required this.name,
    required this.price,
    this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240.w,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isDark
                ? MyColors.dark.outlineVariant
                : MyColors.light.outlineVariant,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                width: 80.w,
                height: 80.h,
                child: imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) => Container(
                          color: MyColors.dark.outline,
                          child: Center(
                            child: SizedBox(
                              width: 18.w,
                              height: 18.w,
                              child: const CircularProgressIndicator(
                                  strokeWidth: 2),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: MyColors.dark.outline,
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 28.sp,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: MyColors.dark.outline,
                        child: Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 28.sp,
                            color: Colors.white54,
                          ),
                        ),
                      ),
              ),
            ),
            const HorizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: MyTextStyle.body.s.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.titleMedium?.color,
                    ),
                  ),
                  const VerticalSpace(4),
                  Text(
                    price,
                    style: MyTextStyle.heading.h5.copyWith(
                      color: MyColors.primary.base,
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
