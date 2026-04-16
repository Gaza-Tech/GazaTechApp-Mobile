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
  final String? sellerAvatarUrl;
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
    this.sellerAvatarUrl,
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
              // Left: product image (no bookmark overlay)
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
                          placeholder: (context, url) => _imagePlaceholder(),
                          errorWidget: (context, url, error) => _imageError(),
                        )
                      : _imageError(),
                ),
              ),
              const HorizontalSpace(10),
              // Right: info column
              Expanded(
                child: SizedBox(
                  height: 110.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top: seller avatar + name
                      if (sellerName.isNotEmpty)
                        Row(
                          children: [
                            _SellerAvatar(
                              avatarUrl: sellerAvatarUrl,
                              sellerName: sellerName,
                            ),
                            const HorizontalSpace(6),
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
                      // Middle: product name
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: MyTextStyle.body.s.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.textTheme.titleMedium?.color,
                            ),
                          ),
                        ),
                      ),
                      // Price row + condition tag
                      Row(
                        children: [
                          Text(
                            price,
                            style: MyTextStyle.heading.h5.copyWith(
                              color: MyColors.primary.base,
                            ),
                          ),
                          if (productCondition.isNotEmpty) ...[
                            const HorizontalSpace(6),
                            ConditionTag(condition: productCondition),
                          ],
                        ],
                      ),
                      // Bottom: location + bookmark
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12.sp,
                            color: theme.textTheme.bodySmall?.color,
                          ),
                          const HorizontalSpace(2),
                          Text(
                            location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: MyTextStyle.body.xs.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                            ),
                          ),
                          const Spacer(),

                          if (onBookmarkToggle != null) ...[
                            const Spacer(),
                            GestureDetector(
                              onTap: onBookmarkToggle,
                              child: Icon(
                                isBookmarked
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                size: 18.sp,
                                color: isBookmarked
                                    ? MyColors.primary.base
                                    : theme.textTheme.bodySmall?.color,
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

class _SellerAvatar extends StatelessWidget {
  final String? avatarUrl;
  final String sellerName;

  const _SellerAvatar({this.avatarUrl, required this.sellerName});

  @override
  Widget build(BuildContext context) {
    final initial = sellerName.isNotEmpty ? sellerName[0].toUpperCase() : '?';

    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: 9.r,
        backgroundImage: CachedNetworkImageProvider(avatarUrl!),
        backgroundColor: MyColors.dark.outline,
      );
    }

    return CircleAvatar(
      radius: 9.r,
      backgroundColor: MyColors.primary.base.withOpacity(0.15),
      child: Text(
        initial,
        style: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w600,
          color: MyColors.primary.base,
        ),
      ),
    );
  }
}
