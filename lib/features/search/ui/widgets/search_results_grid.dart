import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/product_card_grid.dart';
import 'package:gaza_tech/features/search/cubit/search_cubit.dart';
import 'package:gaza_tech/features/search/cubit/search_state.dart';

class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        final listings = state.results;
        final isArabic =
            Localizations.localeOf(context).languageCode == 'ar';

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification &&
                notification.metrics.extentAfter == 0) {
              cubit.loadMore();
            }
            return false;
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16.w),
                sliver: SliverList.separated(
                  separatorBuilder: (_, _) => SizedBox(height: 12.h),
                  itemCount: listings.length,
                  itemBuilder: (context, index) {
                    final listing = listings[index];
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
                      imageUrl: listing.thumbnailUrl,
                      onTap: () => context.pushNamed(
                        MyRoutes.listingDetails,
                        arguments: listing.listingId,
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: !state.hasMore
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: Icon(Icons.circle, size: 12)),
                      )
                    : state.isLoadingMore
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child:
                                Center(child: CircularProgressIndicator()),
                          )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }
}
