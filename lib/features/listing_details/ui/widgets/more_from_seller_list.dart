import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/product_card_vertical.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';

class MoreFromSellerList extends StatelessWidget {
  final List<ListingModel> listings;

  const MoreFromSellerList({super.key, required this.listings});

  @override
  Widget build(BuildContext context) {
    if (listings.isEmpty) {
      return Text(
        context.l10n.noListingsAvailable,
        style: Theme.of(context).textTheme.bodySmall,
      );
    }

    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      children: listings.map((listing) {
        final locationName = isArabic
            ? (listing.locationNameAr.isNotEmpty
                  ? listing.locationNameAr
                  : listing.locationName)
            : listing.locationName;
        final timeAgo = _formatTimeAgo(context, listing.createdAt);
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: ProductCardVertical(
            name: listing.title,
            price: '${listing.currency == "ILS" ? "₪" : "\$"}${listing.price}',
            location: locationName,
            timeAgo: timeAgo,
            imageUrl: listing.thumbnailUrl,
            onTap: () => context.pushNamed(
              MyRoutes.listingDetails,
              arguments: listing.listingId,
            ),
          ),
        );
      }).toList(),
    );
  }

  String _formatTimeAgo(BuildContext context, DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    final l10n = context.l10n;

    if (difference.inDays >= 7) {
      return l10n.weekAgo;
    } else if (difference.inDays > 0) {
      return l10n.daysAgo(difference.inDays);
    } else {
      return l10n.daysAgo(1);
    }
  }
}
