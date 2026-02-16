import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_cubit.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_state.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/product_card_grid.dart';

class ListingsTabView extends StatefulWidget {
  final String category;

  const ListingsTabView({super.key, required this.category});

  @override
  State<ListingsTabView> createState() => _ListingsTabViewState();
}

class _ListingsTabViewState extends State<ListingsTabView>
    with AutomaticKeepAliveClientMixin {
  late final MarketplaceCubit _marketplaceCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _marketplaceCubit = context.read<MarketplaceCubit>();
    _marketplaceCubit.fetchIfNeeded(widget.category);
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      _marketplaceCubit.fetchMore(widget.category);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocConsumer<MarketplaceCubit, MarketplaceState>(
      listener: (context, state) {
        if (state.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.white),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Text(
                      state.errorMessage ?? 'Something went wrong',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              duration: const Duration(seconds: 4),
            ),
          );
        }
      },
      builder: (context, state) {
        final listings = state.listingsFor(widget.category);

        // Show loading indicator for initial load
        if (state.isInitialLoading && listings.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Show empty state
        if (listings.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => _marketplaceCubit.fetchListings(widget.category),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(child: Text(context.l10n.noListingsAvailable)),
              ),
            ),
          );
        }

        // Show listings in grid
        return RefreshIndicator(
          onRefresh: () async {
            if (!state.hasMoreFor(widget.category)) {
              _marketplaceCubit.resetPagination(widget.category);
            }
            await _marketplaceCubit.fetchListings(widget.category);
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: _onScrollNotification,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(16.w),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 0.7,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final listing = listings[index];
                      final isArabic =
                          Localizations.localeOf(context).languageCode == 'ar';
                      final locationName = isArabic
                          ? (listing.locationNameAr.isNotEmpty
                              ? listing.locationNameAr
                              : listing.locationName)
                          : listing.locationName;
                      return ProductCardGrid(
                        name: listing.title,
                        price:
                            '${listing.currency == "ILS" ? "₪" : "\$"}${listing.price}',
                        location: locationName,
                        sellerName: listing.sellerName,
                        productCondition: listing.productCondition,
                        onTap: () => context.pushNamed(
                          MyRoutes.listingDetails,
                          arguments: listing.listingId,
                        ),
                      );
                    }, childCount: listings.length),
                  ),
                ),
                // Loading indicator / end-of-list marker
                SliverToBoxAdapter(
                  child: !state.hasMoreFor(widget.category)
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: Icon(Icons.circle, size: 12)),
                        )
                      : const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
