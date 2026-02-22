import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/product_card_horizontal.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';

class SimilarProductsList extends StatelessWidget {
  final List<ListingModel> listings;

  const SimilarProductsList({super.key, required this.listings});

  @override
  Widget build(BuildContext context) {
    if (listings.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(
          context.l10n.noListingsAvailable,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
    }

    return SizedBox(
      height: 190.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: listings.length,
        separatorBuilder: (_, _) => const HorizontalSpace(12),
        itemBuilder: (context, index) {
          final listing = listings[index];
          return ProductCardHorizontal(
            name: listing.title,
            price:
                '${listing.currency == "ILS" ? "₪" : "\$"}${listing.price}',
            imageUrl: listing.thumbnailUrl,
            onTap: () => context.pushNamed(
              MyRoutes.listingDetails,
              arguments: listing.listingId,
            ),
          );
        },
      ),
    );
  }
}
