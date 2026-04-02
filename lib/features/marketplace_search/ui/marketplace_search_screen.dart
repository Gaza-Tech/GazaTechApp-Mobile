import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/active_filters_bar.dart';
import 'package:gaza_tech/core/widgets/recent_searches_view.dart';
import 'package:gaza_tech/core/widgets/search_app_bar.dart';
import 'package:gaza_tech/features/marketplace_search/cubit/marketplace_search_cubit.dart';
import 'package:gaza_tech/features/marketplace_search/cubit/marketplace_search_state.dart';
import 'package:gaza_tech/features/marketplace_search/data/models/marketplace_search_filters_model.dart';
import 'widgets/filter_bottom_sheet.dart';
import 'widgets/search_results_grid.dart';

class MarketpalceSearchScreen extends StatelessWidget {
  const MarketpalceSearchScreen({super.key});

  List<({String label, VoidCallback onRemove})> _buildFilterChips(
    BuildContext context,
    MarketplaceSearchState state,
    MarketplaceSearchCubit cubit,
  ) {
    final l10n = context.l10n;
    final filters = state.filters;
    final chips = <({String label, VoidCallback onRemove})>[];

    if (filters.categoryId != null && filters.categoryName != null) {
      chips.add((
        label: filters.categoryName!,
        onRemove: () => cubit.clearFilter('category'),
      ));
    }

    if (filters.locationId != null && filters.locationName != null) {
      chips.add((
        label: filters.locationName!,
        onRemove: () => cubit.clearFilter('location'),
      ));
    }

    if (filters.conditions.isNotEmpty) {
      final labels = filters.conditions
          .map((c) {
            switch (c) {
              case 'brand_new':
                return l10n.conditionBrandNew;
              case 'used_excellent':
                return l10n.conditionUsedExcellent;
              case 'used_good':
                return l10n.conditionUsedGood;
              case 'for_parts':
                return l10n.conditionForParts;
              default:
                return c;
            }
          })
          .join(', ');
      chips.add((
        label: labels,
        onRemove: () => cubit.clearFilter('condition'),
      ));
    }

    if (filters.priceMinUsd != null || filters.priceMaxUsd != null) {
      final min = filters.priceMinUsd?.toString() ?? '0';
      final max = filters.priceMaxUsd?.toString() ?? '∞';
      chips.add((
        label: '\$$min – \$$max',
        onRemove: () => cubit.clearFilter('price'),
      ));
    }

    if (filters.priceMinIls != null || filters.priceMaxIls != null) {
      final min = filters.priceMinIls?.toString() ?? '0';
      final max = filters.priceMaxIls?.toString() ?? '∞';
      chips.add((
        label: '₪$min – ₪$max',
        onRemove: () => cubit.clearFilter('price'),
      ));
    }

    if (filters.sort != SearchSortOption.newest) {
      chips.add((
        label: _getSortLabel(context, filters.sort),
        onRemove: () => cubit.clearFilter('sort'),
      ));
    }

    return chips;
  }

  String _getSortLabel(BuildContext context, SearchSortOption sort) {
    final l10n = context.l10n;
    switch (sort) {
      case SearchSortOption.newest:
        return l10n.sortNewest;
      case SearchSortOption.oldest:
        return l10n.oldest;
      case SearchSortOption.priceLowToHigh:
        return l10n.sortPriceLowToHigh;
      case SearchSortOption.priceHighToLow:
        return l10n.sortPriceHighToLow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MarketplaceSearchCubit>();

    return Scaffold(
      appBar: SearchAppBar(
        controller: cubit.searchController,
        hintText: context.l10n.searchHint,
        autofocus: true,
        onClear: cubit.clearSearch,
        onSearch: cubit.search,
        actions: [
          BlocBuilder<MarketplaceSearchCubit, MarketplaceSearchState>(
            buildWhen: (prev, curr) =>
                prev.filters.hasActiveFilters !=
                    curr.filters.hasActiveFilters ||
                prev.filters.sort != curr.filters.sort,
            builder: (context, state) {
              return IconButton(
                icon: Badge(
                  isLabelVisible:
                      state.filters.hasActiveFilters ||
                      state.filters.sort != SearchSortOption.newest,
                  child: const Icon(Icons.tune_rounded),
                ),
                onPressed: () => showFilterBottomSheet(context),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<MarketplaceSearchCubit, MarketplaceSearchState>(
        builder: (context, state) {
          return Column(
            children: [
              ActiveFiltersBar(chips: _buildFilterChips(context, state, cubit)),
              Expanded(child: _buildBody(context, state, cubit)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    MarketplaceSearchState state,
    MarketplaceSearchCubit cubit,
  ) {
    if (state.isInitial) {
      if (state.recentSearches.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search, size: 64.sp, color: Colors.grey),
              SizedBox(height: 16.h),
              Text(
                context.l10n.searchPrompt,
                style: MyTextStyle.body.l.copyWith(color: Colors.grey),
              ),
            ],
          ),
        );
      }
      return RecentSearchesView(
        recentSearches: state.recentSearches,
        onSearchTap: cubit.searchFromRecent,
        onRemoveTap: cubit.removeRecentSearch,
        onClearAll: cubit.clearRecentSearches,
      );
    }

    if (state.isSearching) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }

    if (state.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 64.sp, color: Colors.grey),
            SizedBox(height: 16.h),
            Text(context.l10n.noResultsFound, style: MyTextStyle.heading.h3),
            SizedBox(height: 8.h),
            Text(
              context.l10n.noResultsSubtitle,
              style: MyTextStyle.body.m.copyWith(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return const SearchResultsGrid();
  }
}
