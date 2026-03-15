import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class ProductCardGrid extends StatelessWidget {
  final String name;
  final String price;
  final String location;
  final String sellerName;
  final String productCondition;
  final String? imageUrl;
  final VoidCallback onTap;

  const ProductCardGrid({
    super.key,
    required this.name,
    required this.price,
    required this.location,
    required this.sellerName,
    required this.productCondition,
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
        padding: EdgeInsets.all(10.w),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) => _imagePlaceholder(),
                        errorWidget: (context, url, error) => _imageError(),
                      )
                    : _imageError(),
              ),
            ),
            const HorizontalSpace(10),
            Expanded(
              child: SizedBox(
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top: seller name
                    if (sellerName.isNotEmpty)
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 13.sp,
                            color: theme.textTheme.bodySmall?.color,
                          ),
                          const HorizontalSpace(4),
                          Flexible(
                            child: Text(
                              sellerName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: MyTextStyle.body.xs.copyWith(
                                color: theme.textTheme.bodySmall?.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    // Middle: name + price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: MyTextStyle.body.s.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.textTheme.titleMedium?.color,
                            ),
                          ),
                          const VerticalSpace(2),
                          Text(
                            price,
                            style: MyTextStyle.heading.h5.copyWith(
                              color: MyColors.primary.base,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bottom: location • condition
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 12.sp,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                        const HorizontalSpace(2),
                        Flexible(
                          child: Text(
                            location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: MyTextStyle.body.xs.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                            ),
                          ),
                        ),
                        if (productCondition.isNotEmpty) ...[
                          const HorizontalSpace(4),
                          Icon(
                            Icons.circle,
                            size: 4,
                            color: theme.textTheme.bodySmall?.color,
                          ),
                          const HorizontalSpace(4),
                          Flexible(
                            child: Text(
                              productCondition,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: MyTextStyle.body.xs.copyWith(
                                color: theme.textTheme.bodySmall?.color,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() => Container(
        color: MyColors.dark.outline,
        child: Center(
          child: SizedBox(
            width: 20.w,
            height: 20.w,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );

  Widget _imageError() => Container(
        color: MyColors.dark.outline,
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 32.sp,
            color: Colors.white54,
          ),
        ),
      );
}
