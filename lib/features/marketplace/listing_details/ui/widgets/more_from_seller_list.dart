import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/marketplace/listing_details/ui/widgets/product_card_vertical.dart';

class _DummyProduct {
  final String name;
  final String price;
  final String location;
  final String timeAgo;
  const _DummyProduct({
    required this.name,
    required this.price,
    required this.location,
    required this.timeAgo,
  });
}

const _products = [
  _DummyProduct(
    name: 'Mechanical Keyboard RGB',
    price: '\$89',
    location: 'Gaza City',
    timeAgo: '5 days ago',
  ),
  _DummyProduct(
    name: 'Wireless Gaming Mouse',
    price: '\$45',
    location: 'Gaza City',
    timeAgo: '1 week ago',
  ),
];

class MoreFromSellerList extends StatelessWidget {
  const MoreFromSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _products
          .map(
            (product) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: ProductCardVertical(
                name: product.name,
                price: product.price,
                location: product.location,
                timeAgo: product.timeAgo,
                onTap: () => context.pushNamed(MyRoutes.listingDetails),
              ),
            ),
          )
          .toList(),
    );
  }
}
