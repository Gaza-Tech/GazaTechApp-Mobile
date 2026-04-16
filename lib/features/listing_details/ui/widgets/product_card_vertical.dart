import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class ProductCardVertical extends StatelessWidget {
  final String name;
  final String price;
  final String location;
  final String timeAgo;
  final String? imageUrl;
  final VoidCallback onTap;

  const ProductCardVertical({
    super.key,
    required this.name,
    required this.price,
    required this.location,
    required this.timeAgo,
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
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(12.dg),
          border: Border.all(
            color: isDark
                ? MyColors.dark.outlineVariant
                : MyColors.light.outlineVariant,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: MyColors.dark.outline,
                borderRadius: BorderRadius.circular(8.dg),
              ),
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      fit: BoxFit.cover,
                      width: 80.w,
                      height: 80.w,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 32.sp,
                          color: Colors.white54,
                        ),
                      ),
                    )
                  : Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 32.sp,
                        color: Colors.white54,
                      ),
                    ),
            ),
            const HorizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: MyTextStyle.heading.h4.copyWith(
                      color: theme.textTheme.titleMedium?.color,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const VerticalSpace(4),
                  Text(
                    price,
                    style: MyTextStyle.heading.h5.copyWith(
                      color: MyColors.primary.base,
                    ),
                  ),
                  const VerticalSpace(8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14.sp,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                      const HorizontalSpace(4),
                      Text(
                        location,
                        style: MyTextStyle.body.xs.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                      const HorizontalSpace(8),
                      Text(
                        '\u2022',
                        style: MyTextStyle.body.xs.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                      const HorizontalSpace(8),
                      Icon(
                        Icons.access_time,
                        size: 14.sp,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                      const HorizontalSpace(4),
                      Flexible(
                        child: Text(
                          timeAgo,
                          style: MyTextStyle.body.xs.copyWith(
                            color: theme.textTheme.bodySmall?.color,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
