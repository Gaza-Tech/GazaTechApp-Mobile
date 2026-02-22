import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/labeled_field.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_cubit.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_state.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/description_section.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/image_carousel.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_info_section.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_tags.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/more_from_seller_list.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/seller_info_card.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/similar_products_list.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/specifications_table.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';

class ListingDetailsScreen extends StatefulWidget {
  const ListingDetailsScreen({super.key});

  @override
  State<ListingDetailsScreen> createState() => _ListingDetailsScreenState();
}

class _ListingDetailsScreenState extends State<ListingDetailsScreen> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<ListingDetailsCubit, ListingDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (message) => _buildErrorState(context, message),
            success: (listing, similarListings, sellerListings) =>
                _buildContent(context, listing, similarListings, sellerListings),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
            const VerticalSpace(16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const VerticalSpace(16),
            ElevatedButton(
              onPressed: () =>
                  context.read<ListingDetailsCubit>().loadListing(),
              child: Text(context.l10n.retry),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ListingDetailModel listing,
    List<ListingModel> similarListings,
    List<ListingModel> sellerListings,
  ) {
    final l10n = context.l10n;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final locationName = isArabic
        ? (listing.locationNameAr.isNotEmpty
            ? listing.locationNameAr
            : listing.locationName)
        : listing.locationName;

    final categoryName = isArabic
        ? (listing.categoryNameAr.isNotEmpty
            ? listing.categoryNameAr
            : listing.categoryName)
        : listing.categoryName;

    final conditionLabel = _getConditionLabel(l10n, listing.productCondition);
    final priceText =
        '${listing.currency == "ILS" ? "₪" : "\$"}${listing.price}';
    final timeAgo = _formatTimeAgo(l10n, listing.createdAt);

    final memberSince = listing.sellerJoinedAt != null
        ? l10n.memberSince(_formatDate(listing.sellerJoinedAt!))
        : '';

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image carousel
          ImageCarousel(
            imageUrls: listing.imageUrls,
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
                  condition: conditionLabel,
                  category: categoryName,
                ),
                const VerticalSpace(12),

                // Title, price, location
                ListingInfoSection(
                  title: listing.title,
                  price: priceText,
                  location: locationName,
                  timeAgo: timeAgo,
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
                  sellerName: listing.sellerName,
                  memberSince: memberSince,
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
                DescriptionSection(description: listing.description),
                const VerticalSpace(24),

                // Specifications
                if (listing.specificationEntries.isNotEmpty) ...[
                  LabeledField(
                    label: l10n.specificationsSectionTitle,
                    isRequired: false,
                  ),
                  const VerticalSpace(12),
                  SpecificationsTable(specs: listing.specificationEntries),
                  const VerticalSpace(24),
                ],
              ],
            ),
          ),

          // Similar products
          if (similarListings.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: LabeledField(
                label: l10n.similarProducts,
                isRequired: false,
              ),
            ),
            const VerticalSpace(12),
            SimilarProductsList(listings: similarListings),
            const VerticalSpace(24),
          ],

          // More from seller
          if (sellerListings.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledField(
                    label: l10n.moreFromSeller(listing.sellerName),
                    isRequired: false,
                  ),
                  const VerticalSpace(12),
                  MoreFromSellerList(listings: sellerListings),
                  const VerticalSpace(24),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String _getConditionLabel(AppLocalizations l10n, String condition) {
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

  String _formatTimeAgo(AppLocalizations l10n, DateTime createdAt) {
    final difference = DateTime.now().difference(createdAt);
    if (difference.inDays >= 7) {
      return l10n.weekAgo;
    } else if (difference.inDays > 0) {
      return l10n.daysAgo(difference.inDays);
    } else {
      return l10n.daysAgo(1);
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
