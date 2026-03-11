import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';

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
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(12.dg),
          border: Border.all(
            color: isDark
                ? MyColors.dark.outlineVariant
                : MyColors.light.outlineVariant,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: MyColors.dark.outline),
                    child: imageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: imageUrl!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                width: 24.w,
                                height: 24.w,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                size: 40.sp,
                                color: Colors.white54,
                              ),
                            ),
                          )
                        : Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 40.sp,
                              color: Colors.white54,
                            ),
                          ),
                  ),
                  // Condition badge
                  PositionedDirectional(
                    top: 8.h,
                    start: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: _getConditionColor(productCondition),
                        borderRadius: BorderRadius.circular(6.dg),
                      ),
                      child: Text(
                        _getConditionLabel(context, productCondition),
                        style: MyTextStyle.body.xs.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Info section
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product name
                    Text(
                      name,
                      style: MyTextStyle.body.s.copyWith(
                        color: theme.textTheme.titleMedium?.color,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Price & Seller
                    Text(
                      price,
                      style: MyTextStyle.heading.h5.copyWith(
                        color: MyColors.primary.base,
                      ),
                    ),
                    if (sellerName.isNotEmpty)
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 12.sp,
                              color: theme.textTheme.bodySmall?.color,
                            ),
                            const HorizontalSpace(2),
                            Flexible(
                              child: Text(
                                sellerName,
                                style: MyTextStyle.body.xs.copyWith(
                                  color: theme.textTheme.bodySmall?.color,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    // Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 12.sp,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                        const HorizontalSpace(2),
                        Expanded(
                          child: Text(
                            location,
                            style: MyTextStyle.body.xs.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
    );
  }

  static String _getConditionLabel(BuildContext context, String condition) {
    final l10n = AppLocalizations.of(context);
    switch (condition.toLowerCase()) {
      case 'new':
        return l10n.conditionNew;
      case 'used':
        return l10n.conditionUsed;
      case 'refurbished':
        return l10n.conditionRefurbished;
      case 'like_new':
        return l10n.conditionLikeNew;
      default:
        return condition;
    }
  }

  static Color _getConditionColor(String condition) {
    switch (condition.toLowerCase()) {
      case 'new':
        return MyColors.primary.base;
      case 'like_new':
        return MyColors.primary.deep;
      case 'refurbished':
        return MyColors.status.warning.main;
      case 'used':
        return MyColors.light.textDisabled;
      default:
        return MyColors.light.textDisabled;
    }
  }
}
