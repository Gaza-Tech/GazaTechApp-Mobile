import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/condition_tag.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class ProductCardGrid extends StatelessWidget {
  final String name;
  final String price;
  final String location;
  final String sellerName;
  final String productCondition;
  final String? imageUrl;
  final VoidCallback onTap;
  final bool isBookmarked;
  final VoidCallback? onBookmarkToggle;

  const ProductCardGrid({
    super.key,
    required this.name,
    required this.price,
    required this.location,
    required this.sellerName,
    required this.productCondition,
    this.imageUrl,
    required this.onTap,
    this.isBookmarked = false,
    this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.w,
                height: 110.h,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: SizedBox(
                        width: 100.w,
                        height: 110.h,
                        child: imageUrl != null
                            ? CachedNetworkImage(
                                imageUrl: imageUrl!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                placeholder: (context, url) =>
                                    _imagePlaceholder(),
                                errorWidget: (context, url, error) =>
                                    _imageError(),
                              )
                            : _imageError(),
                      ),
                    ),
                    if (onBookmarkToggle != null)
                      Positioned(
                        top: 4.h,
                        right: 4.w,
                        child: GestureDetector(
                          onTap: onBookmarkToggle,
                          child: Container(
                            width: 28.w,
                            height: 28.w,
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              size: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const HorizontalSpace(10),
              Expanded(
                child: SizedBox(
                  height: 110.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top: condition tag
                      if (productCondition.isNotEmpty)
                        ConditionTag(condition: productCondition),
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
                      // Bottom: seller • location
                      Row(
                        children: [
                          if (sellerName.isNotEmpty) ...[
                            Icon(
                              Icons.person_outline,
                              size: 13.sp,
                              color: theme.textTheme.bodySmall?.color,
                            ),
                            const HorizontalSpace(2),
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
                            const HorizontalSpace(4),
                            Icon(
                              Icons.circle,
                              size: 4,
                              color: theme.textTheme.bodySmall?.color,
                            ),
                            const HorizontalSpace(4),
                          ],
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
