import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/labeled_field.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/description_section.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/image_carousel.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_info_section.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_tags.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/more_from_seller_list.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/seller_info_card.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/similar_products_list.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/specifications_table.dart';

class ListingDetailsScreen extends StatefulWidget {
  const ListingDetailsScreen({super.key});

  @override
  State<ListingDetailsScreen> createState() => _ListingDetailsScreenState();
}

class _ListingDetailsScreenState extends State<ListingDetailsScreen> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.share_rounded), onPressed: () {}),
          IconButton(icon: const Icon(Icons.flag_rounded), onPressed: () {}),
          SizedBox(width: 4.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image carousel
            ImageCarousel(
              imageCount: 4,
              isBookmarked: _isBookmarked,
              onBookmarkToggle: () {
                setState(() => _isBookmarked = !_isBookmarked);
              },
            ),

            // Main content with horizontal padding
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(16),

                  // Tags
                  ListingTags(
                    condition: l10n.conditionLikeNew,
                    category: l10n.categoryElectronics,
                  ),
                  const VerticalSpace(12),

                  // Title, price, location
                  ListingInfoSection(
                    title: 'Gaming Laptop RTX 3070',
                    price: '\$1,299',
                    location: l10n.locationGazaCity,
                    timeAgo: l10n.daysAgo(2),
                  ),
                  const VerticalSpace(16),

                  const Divider(),
                  const VerticalSpace(16),

                  // Seller information
                  LabeledField(
                    label: l10n.sellerInformation,
                    isRequired: false,
                  ),
                  const VerticalSpace(12),
                  SellerInfoCard(
                    sellerName: 'Ahmed Hassan',
                    memberSince: l10n.memberSince('Jan 2023'),
                    onContactSeller: () {},
                    onViewProfile: () {},
                  ),
                  const VerticalSpace(16),

                  const Divider(),
                  const VerticalSpace(16),

                  // Description
                  LabeledField(
                    label: l10n.descriptionSectionTitle,
                    isRequired: false,
                  ),
                  const VerticalSpace(12),
                  const DescriptionSection(
                    description:
                        'High-performance gaming laptop in excellent condition. '
                        'Features NVIDIA RTX 3070 graphics card, Intel i7 processor, '
                        '16GB RAM, and 512GB SSD. Perfect for gaming, video editing, '
                        'and heavy multitasking. Includes original box and charger. '
                        'Battery health at 95%. No scratches or dents.',
                  ),
                  const VerticalSpace(24),

                  // Specifications
                  LabeledField(
                    label: l10n.specificationsSectionTitle,
                    isRequired: false,
                  ),
                  const VerticalSpace(12),
                  const SpecificationsTable(
                    specs: [
                      MapEntry('Processor', 'Intel Core i7-11800H'),
                      MapEntry('Graphics', 'NVIDIA RTX 3070'),
                      MapEntry('RAM', '16GB DDR4'),
                      MapEntry('Storage', '512GB NVMe SSD'),
                      MapEntry('Display', '15.6" FHD 144Hz'),
                    ],
                  ),
                  const VerticalSpace(24),
                ],
              ),
            ),

            // Similar products (has its own horizontal padding for scroll)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: LabeledField(
                label: l10n.similarProducts,
                isRequired: false,
              ),
            ),
            const VerticalSpace(12),
            const SimilarProductsList(),
            const VerticalSpace(24),

            // More from seller
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledField(
                    label: l10n.moreFromSeller('Ahmed Hassan'),
                    isRequired: false,
                  ),
                  const VerticalSpace(12),
                  const MoreFromSellerList(),
                  const VerticalSpace(24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
