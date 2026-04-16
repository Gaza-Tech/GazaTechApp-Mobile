import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/ai_chat/data/models/ai_chat_listing_model.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/product_card_grid.dart';

class AiListingList extends StatelessWidget {
  final List<AiChatListingModel> listings;

  const AiListingList({super.key, required this.listings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Column(
        children: listings.map((listing) {
          final symbol = listing.currency == 'ILS' ? '₪' : '\$';
          final price = '$symbol ${listing.price}';

          return Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: ProductCardGrid(
              name: listing.title,
              price: price,
              location: listing.location ?? '',
              sellerName: listing.sellerName ?? '',
              productCondition: listing.productCondition,
              imageUrl: listing.image,
              onTap: () => context.pushNamed(
                MyRoutes.listingDetails,
                arguments: listing.listingId,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
