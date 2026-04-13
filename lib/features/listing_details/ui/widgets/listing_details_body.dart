import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/guest_guard.dart';
import 'package:gaza_tech/core/helpers/url_launcher_helper.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/add_listing/ui/widgets/labeled_field.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/description_section.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_info_section.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_tags.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/more_from_seller_list.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/seller_info_card.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/similar_products_list.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/specifications_table.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';

class ListingDetailsBody extends StatelessWidget {
  final ListingDetailModel listing;
  final List<ListingModel> similarListings;
  final List<ListingModel> sellerListings;
  final bool isBookmarked;
  final SliverAppBar sliverAppBar;

  const ListingDetailsBody({
    super.key,
    required this.listing,
    required this.similarListings,
    required this.sellerListings,
    required this.isBookmarked,
    required this.sliverAppBar,
  });

  @override
  Widget build(BuildContext context) {
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

    final priceText =
        '${listing.currency == "ILS" ? "₪" : "\$"}${listing.price}';
    final timeAgo = _formatTimeAgo(l10n, listing.createdAt);

    final memberSince = listing.sellerJoinedAt != null
        ? l10n.memberSince(_formatDate(listing.sellerJoinedAt!))
        : '';

    return CustomScrollView(
      slivers: [
        sliverAppBar,
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(16),
                ListingTags(
                  condition: listing.productCondition ?? '',
                  category: categoryName,
                ),
                const VerticalSpace(12),
                ListingInfoSection(
                  title: listing.title,
                  price: priceText,
                  location: locationName,
                  timeAgo: timeAgo,
                ),
                const VerticalSpace(16),
                const Divider(),
                const VerticalSpace(16),
                LabeledField(label: l10n.sellerInformation, isRequired: false),
                const VerticalSpace(12),
                SellerInfoCard(
                  sellerName: listing.sellerName,
                  memberSince: memberSince,
                  avatarUrl: listing.sellerAvatarUrl,
                  onContactSeller: () async {
                    if (!await GuestGuard.requireAccount(context)) return;
                    if (context.mounted) _handleContactSeller(context);
                  },
                  onViewProfile: () async {
                    if (!await GuestGuard.requireAccount(context)) return;
                    if (context.mounted) {
                      Navigator.pushNamed(
                        context,
                        MyRoutes.profile,
                        arguments: {
                          'userId': listing.sellerId,
                          'isOwnProfile': false,
                        },
                      );
                    }
                  },
                ),
                const VerticalSpace(16),
                const Divider(),
                const VerticalSpace(16),
                LabeledField(
                  label: l10n.descriptionSectionTitle,
                  isRequired: false,
                ),
                const VerticalSpace(12),
                DescriptionSection(description: listing.description),
                const VerticalSpace(24),
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
        ),
        if (similarListings.isNotEmpty)
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            ),
          ),
        if (sellerListings.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
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
          ),
      ],
    );
  }

  void _handleContactSeller(BuildContext context) async {
    final l10n = context.l10n;
    if (listing.sellerWhatsappNumber != null) {
      final success = await UrlLauncherHelper.launchWhatsApp(
        listing.sellerWhatsappNumber!,
      );
      if (!success && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.couldNotOpenLink)));
      }
    } else if (listing.sellerPhoneNumber != null) {
      final success = await UrlLauncherHelper.launchPhoneDialer(
        listing.sellerPhoneNumber!,
      );
      if (!success && context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.couldNotOpenLink)));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.contactUnavailable)));
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
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
