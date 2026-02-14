import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/marketplace/listing_details/ui/widgets/product_card_horizontal.dart';

class _DummyProduct {
  final String name;
  final String price;
  const _DummyProduct({required this.name, required this.price});
}

const _products = [
  _DummyProduct(name: 'ASUS ROG Laptop', price: '\$1,150'),
  _DummyProduct(name: 'MSI Gaming Laptop', price: '\$1,399'),
  _DummyProduct(name: 'Lenovo Legion Pro', price: '\$1,250'),
  _DummyProduct(name: 'Dell G15 Gaming', price: '\$999'),
];

class SimilarProductsList extends StatelessWidget {
  const SimilarProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _products.length,
        separatorBuilder: (_, _) => const HorizontalSpace(12),
        itemBuilder: (context, index) => ProductCardHorizontal(
          name: _products[index].name,
          price: _products[index].price,
          onTap: () => context.pushNamed(MyRoutes.listingDetails),
        ),
      ),
    );
  }
}
