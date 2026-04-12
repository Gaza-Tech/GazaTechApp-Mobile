import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/confirmation_sheet.dart';
import 'package:gaza_tech/core/widgets/delete_confirmation_sheet.dart';
import 'package:gaza_tech/features/drafts/cubit/drafts_cubit.dart';
import 'package:gaza_tech/features/drafts/cubit/drafts_state.dart';
import 'package:gaza_tech/features/drafts/ui/widgets/draft_listing_card.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';

class DraftListingsTab extends StatefulWidget {
  const DraftListingsTab({super.key});

  @override
  State<DraftListingsTab> createState() => _DraftListingsTabState();
}

class _DraftListingsTabState extends State<DraftListingsTab>
    with AutomaticKeepAliveClientMixin {
  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      context.read<DraftsCubit>().fetchMoreListingDrafts();
    }
    return false;
  }

  Future<void> _navigateToEdit(
    BuildContext context,
    ListingDetailModel listing,
  ) async {
    final result = await Navigator.pushNamed(
      context,
      MyRoutes.editListing,
      arguments: listing,
    );
    if (!context.mounted) return;
    if (result == true) {
      context.read<DraftsCubit>().fetchListingDrafts();
    }
  }

  void _showDeleteConfirmation(BuildContext context, String listingId) {
    final l10n = context.l10n;
    showDeleteConfirmationSheet(
      context,
      title: l10n.deleteListingConfirmTitle,
      body: l10n.deleteListingConfirmBody,
      onConfirm: () async {
        final success = await context.read<DraftsCubit>().deleteListingDraft(
          listingId,
        );
        if (success && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.listingDeleted)));
        }
      },
    );
  }

  void _showPublishConfirmation(BuildContext context, String listingId) {
    final l10n = context.l10n;
    showConfirmationSheet(
      context,
      title: l10n.publishConfirmTitle,
      body: l10n.publishConfirmBody,
      confirmLabel: l10n.publish,
      onConfirm: () async {
        final success = await context.read<DraftsCubit>().publishListingDraft(
          listingId,
        );
        if (success && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.published)));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<DraftsCubit, DraftsState>(
      builder: (context, state) {
        if (state.isListingsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.listings.isEmpty) {
          return Center(child: Text(context.l10n.noDraftsYet));
        }

        final isArabic = Localizations.localeOf(context).languageCode == 'ar';

        return NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16.w),
                sliver: SliverList.separated(
                  separatorBuilder: (_, _s) => SizedBox(height: 12.h),
                  itemCount: state.listings.length,
                  itemBuilder: (context, index) {
                    final listing = state.listings[index];
                    final locationName = isArabic
                        ? (listing.locationNameAr.isNotEmpty
                              ? listing.locationNameAr
                              : listing.locationName)
                        : listing.locationName;
                    return DraftListingCard(
                      name: listing.title,
                      price:
                          '${listing.currency == "ILS" ? "₪" : "\$"}${listing.price}',
                      location: locationName,
                      sellerName: listing.sellerName,
                      productCondition: listing.productCondition ?? '',
                      imageUrl: listing.imageUrls.isNotEmpty
                          ? listing.imageUrls.first
                          : null,
                      onEdit: () => _navigateToEdit(context, listing),
                      onDelete: () =>
                          _showDeleteConfirmation(context, listing.listingId),
                      onPublish: () =>
                          _showPublishConfirmation(context, listing.listingId),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: state.isListingsLoadingMore
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SizedBox(height: 80.h),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
