import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/condition_tag.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class DraftListingCard extends StatelessWidget {
  final String name;
  final String price;
  final String location;
  final String sellerName;
  final String productCondition;
  final String? imageUrl;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onPublish;

  const DraftListingCard({
    super.key,
    required this.name,
    required this.price,
    required this.location,
    required this.sellerName,
    required this.productCondition,
    required this.onEdit,
    required this.onDelete,
    required this.onPublish,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ListingImage(imageUrl: imageUrl),
                const HorizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (productCondition.isNotEmpty)
                        ConditionTag(condition: productCondition),
                      SizedBox(height: 4.h),
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
                      const VerticalSpace(4),
                      _SellerLocationRow(
                        sellerName: sellerName,
                        location: location,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                _ActionButton(
                  icon: Icons.delete_outlined,
                  label: l10n.delete,
                  onTap: onDelete,
                  color: theme.colorScheme.error,
                ),
                SizedBox(width: 8.w),
                _ActionButton(
                  icon: Icons.edit_outlined,
                  label: l10n.edit,
                  onTap: onEdit,
                ),
                const Spacer(),
                OutlinedButton.icon(
                  onPressed: onPublish,
                  icon: const Icon(Icons.publish_outlined, size: 14),
                  label: Text(l10n.publish),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.colorScheme.onSurfaceVariant;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16.sp, color: effectiveColor),
            SizedBox(width: 4.w),
            Text(
              label,
              style: MyTextStyle.body.xs.copyWith(color: effectiveColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _SellerLocationRow extends StatelessWidget {
  final String sellerName;
  final String location;

  const _SellerLocationRow({required this.sellerName, required this.location});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
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
          Icon(Icons.circle, size: 4, color: theme.textTheme.bodySmall?.color),
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
    );
  }
}

class _ListingImage extends StatelessWidget {
  final String? imageUrl;

  const _ListingImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        width: 100.w,
        height: 100.w,
        child: imageUrl != null
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                placeholder: (_, _) => _placeholder(),
                errorWidget: (_, _, _) => _error(),
              )
            : _error(),
      ),
    );
  }

  Widget _placeholder() => Container(
    color: MyColors.dark.outline,
    child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
  );

  Widget _error() => Container(
    color: MyColors.dark.outline,
    child: const Center(
      child: Icon(Icons.image_not_supported_outlined, color: Colors.white54),
    ),
  );
}
