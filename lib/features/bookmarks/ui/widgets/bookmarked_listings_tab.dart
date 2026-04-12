import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/bookmarks/cubit/bookmarks_cubit.dart';
import 'package:gaza_tech/features/bookmarks/cubit/bookmarks_state.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/product_card_grid.dart';

class BookmarkedListingsTab extends StatefulWidget {
  const BookmarkedListingsTab({super.key});

  @override
  State<BookmarkedListingsTab> createState() => _BookmarkedListingsTabState();
}

class _BookmarkedListingsTabState extends State<BookmarkedListingsTab>
    with AutomaticKeepAliveClientMixin {
  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      context.read<BookmarksCubit>().fetchMoreBookmarkedListings();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<BookmarksCubit, BookmarksState>(
      builder: (context, state) {
        if (state.isListingsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.bookmarkedListings.isEmpty) {
          return Center(child: Text(context.l10n.noBookmarkedListingsYet));
        }

        final isArabic = Localizations.localeOf(context).languageCode == 'ar';

        return NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16.w),
                sliver: SliverList.separated(
                  separatorBuilder: (_, _) => SizedBox(height: 12.h),
                  itemCount: state.bookmarkedListings.length,
                  itemBuilder: (context, index) {
                    final listing = state.bookmarkedListings[index];
                    final locationName = isArabic
                        ? (listing.locationNameAr.isNotEmpty
                              ? listing.locationNameAr
                              : listing.locationName)
                        : listing.locationName;
                    final cubit = context.read<BookmarksCubit>();
                    return ProductCardGrid(
                      name: listing.title,
                      price:
                          '${listing.currency == "ILS" ? "₪" : "\$"}${listing.price}',
                      location: locationName,
                      sellerName: listing.sellerName,
                      productCondition: listing.productCondition ?? '',
                      imageUrl: listing.thumbnailUrl,
                      isBookmarked: state.bookmarkedListingIds.contains(
                        listing.listingId,
                      ),
                      onBookmarkToggle: () =>
                          cubit.toggleListingBookmark(listing.listingId),
                      onTap: () => context.pushNamed(
                        MyRoutes.listingDetails,
                        arguments: listing.listingId,
                      ),
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
