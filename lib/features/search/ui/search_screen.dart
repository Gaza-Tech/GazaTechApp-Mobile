import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/active_filters_bar.dart';
import 'package:gaza_tech/core/widgets/recent_searches_view.dart';
import 'package:gaza_tech/core/widgets/search_app_bar.dart';
import 'package:gaza_tech/features/search/cubit/search_cubit.dart';
import 'package:gaza_tech/features/search/cubit/search_state.dart';
import 'widgets/filter_bottom_sheet.dart';
import 'widgets/search_results_grid.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  List<({String label, VoidCallback onRemove})> _buildFilterChips(
    BuildContext context,
    SearchState state,
    SearchCubit cubit,
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

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    return Scaffold(
      appBar: SearchAppBar(
        controller: cubit.searchController,
        hintText: context.l10n.searchHint,
        onClear: cubit.clearSearch,
        onSearch: cubit.search,
        actions: [
          BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (prev, curr) =>
                prev.filters.activeFilterCount !=
                curr.filters.activeFilterCount,
            builder: (context, state) {
              final count = state.filters.activeFilterCount;
              return IconButton(
                icon: Badge(
                  isLabelVisible: count > 0,
                  label: Text(
                    count.toString(),
                    style: TextStyle(fontSize: 10.sp),
                  ),
                  backgroundColor: MyColors.primary.base,
                  child: const Icon(Icons.tune_rounded),
                ),
                onPressed: () => showFilterBottomSheet(context),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.white),
                    SizedBox(width: 16.w),
                    Flexible(
                      child: Text(
                        state.errorMessage ?? '',
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
    SearchState state,
    SearchCubit cubit,
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

    if (state.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 64.sp, color: Colors.grey),
            SizedBox(height: 16.h),
            Text(
              context.l10n.noResultsFound,
              style: MyTextStyle.heading.h3,
            ),
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
