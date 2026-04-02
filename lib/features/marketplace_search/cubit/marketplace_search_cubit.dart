import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/cache/shared_pref_keys.dart';
import 'package:gaza_tech/core/helpers/shared_pref_helper.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/services/bookmark_event_service.dart';
import '../data/models/marketplace_search_filters_model.dart';
import '../data/repos/marketplace_search_repo.dart';
import 'marketplace_search_state.dart';

class MarketplaceSearchCubit extends Cubit<MarketplaceSearchState> {
  final MarketplaceSearchRepo _repo;
  final BookmarkEventService _bookmarkEventService;
  late final StreamSubscription<ListingBookmarkEvent> _bookmarkSub;

  final TextEditingController searchController = TextEditingController();

  MarketplaceSearchCubit(this._repo, this._bookmarkEventService)
    : super(const MarketplaceSearchState()) {
    _bookmarkSub = _bookmarkEventService.listingBookmarkChanges.listen(
      _onListingBookmarkEvent,
    );
  }

  void _onListingBookmarkEvent(ListingBookmarkEvent event) {
    final current = state.bookmarkedListingIds;
    if (current.contains(event.listingId) == event.isBookmarked) return;

    final updated = Set<String>.from(current);
    event.isBookmarked
        ? updated.add(event.listingId)
        : updated.remove(event.listingId);
    emit(state.copyWith(bookmarkedListingIds: updated));
  }

  /// Load categories and locations for filter dropdowns
  Future<void> loadFilterData() async {
    if (state.categories.isNotEmpty) return;

    emit(state.copyWith(isFilterDataLoading: true));

    final categoriesResult = await _repo.getCategories();
    final locationsResult = await _repo.getLocations();

    categoriesResult.when(
      success: (categories) {
        locationsResult.when(
          success: (locations) {
            emit(
              state.copyWith(
                categories: categories,
                locations: locations,
                isFilterDataLoading: false,
              ),
            );
          },
          failure: (error) {
            emit(
              state.copyWith(
                isFilterDataLoading: false,
                errorMessage: error.message,
              ),
            );
          },
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isFilterDataLoading: false,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  Future<void> loadRecentSearches() async {
    final raw = await SharedPrefHelper.getString(
      SharedPrefKeys.marketplaceRecentSearches,
    );
    if (raw.isEmpty) return;
    try {
      final decoded = List<String>.from(jsonDecode(raw) as List);
      emit(state.copyWith(recentSearches: decoded));
    } catch (_) {}
  }

  /// Execute search (fresh, page 0)
  Future<void> search() async {
    final keyword = searchController.text.trim();

    if (keyword.isEmpty && !state.filters.hasActiveFilters) return;

    List<String> updatedRecentSearches = state.recentSearches;
    if (keyword.isNotEmpty) {
      final updated = [
        keyword,
        ...state.recentSearches.where((s) => s != keyword),
      ];
      final capped = updated.take(10).toList();
      await SharedPrefHelper.setData(
        SharedPrefKeys.marketplaceRecentSearches,
        jsonEncode(capped),
      );
      updatedRecentSearches = capped;
    }

    emit(
      state.copyWith(
        keyword: keyword,
        isSearching: true,
        results: [],
        currentPage: 0,
        hasMore: true,
        errorMessage: null,
        recentSearches: updatedRecentSearches,
      ),
    );

    final result = await _repo.searchListings(
      keyword: keyword.isEmpty ? null : keyword,
      filters: state.filters,
      page: 0,
    );

    result.when(
      success: (response) {
        final newBookmarkedIds = response.listings
            .where((l) => l.isBookmarked)
            .map((l) => l.listingId)
            .toSet();
        emit(
          state.copyWith(
            results: response.listings,
            hasMore: response.hasMore,
            currentPage: 0,
            isSearching: false,
            bookmarkedListingIds: newBookmarkedIds,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isSearching: false, errorMessage: error.message));
      },
    );
  }

  /// Load more results (pagination)
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    final nextPage = state.currentPage + 1;
    emit(state.copyWith(isLoadingMore: true));

    final result = await _repo.searchListings(
      keyword: state.keyword.isEmpty ? null : state.keyword,
      filters: state.filters,
      page: nextPage,
    );

    result.when(
      success: (response) {
        final fetchedIds =
            response.listings.map((l) => l.listingId).toSet();
        final newBookmarkedIds = response.listings
            .where((l) => l.isBookmarked)
            .map((l) => l.listingId)
            .toSet();
        final cleanedIds = state.bookmarkedListingIds.difference(fetchedIds);

        emit(
          state.copyWith(
            results: [...state.results, ...response.listings],
            hasMore: response.hasMore,
            currentPage: nextPage,
            isLoadingMore: false,
            bookmarkedListingIds: {...cleanedIds, ...newBookmarkedIds},
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoadingMore: false, errorMessage: error.message));
      },
    );
  }

  /// Toggle bookmark for a listing (optimistic update)
  Future<void> toggleListingBookmark(String listingId) async {
    final wasBookmarked = state.bookmarkedListingIds.contains(listingId);
    final optimisticIds = Set<String>.from(state.bookmarkedListingIds);
    wasBookmarked
        ? optimisticIds.remove(listingId)
        : optimisticIds.add(listingId);
    emit(state.copyWith(bookmarkedListingIds: optimisticIds));
    _bookmarkEventService.emitListingBookmark(
      listingId,
      isBookmarked: !wasBookmarked,
    );

    final result = await _repo.toggleListingBookmark(listingId);

    result.when(
      success: (_) {},
      failure: (_) {
        final revertedIds = Set<String>.from(state.bookmarkedListingIds);
        wasBookmarked
            ? revertedIds.add(listingId)
            : revertedIds.remove(listingId);
        emit(state.copyWith(bookmarkedListingIds: revertedIds));
        _bookmarkEventService.emitListingBookmark(
          listingId,
          isBookmarked: wasBookmarked,
        );
      },
    );
  }

  /// Apply filter and re-search
  void updateFilter(MarketplaceSearchFiltersModel filter) {
    emit(state.copyWith(filters: filter));
    search();
  }

  /// Clear search text and reset to initial state
  void clearSearch() {
    searchController.clear();
    emit(
      state.copyWith(
        keyword: '',
        results: [],
        currentPage: 0,
        hasMore: true,
        isSearching: false,
        errorMessage: null,
      ),
    );
  }

  Future<void> removeRecentSearch(String query) async {
    final updated = state.recentSearches.where((s) => s != query).toList();
    await SharedPrefHelper.setData(
      SharedPrefKeys.marketplaceRecentSearches,
      jsonEncode(updated),
    );
    emit(state.copyWith(recentSearches: updated));
  }

  Future<void> clearRecentSearches() async {
    await SharedPrefHelper.removeData(SharedPrefKeys.marketplaceRecentSearches);
    emit(state.copyWith(recentSearches: []));
  }

  void searchFromRecent(String query) {
    searchController.text = query;
    search();
  }

  /// Clear all filters and re-search
  void clearFilters() {
    emit(state.copyWith(filters: const MarketplaceSearchFiltersModel()));
    if (state.keyword.isNotEmpty) search();
  }

  /// Clear a specific filter type and re-search
  void clearFilter(String type) {
    switch (type) {
      case 'category':
        emit(
          state.copyWith(
            filters: state.filters.copyWith(
              categoryId: null,
              categoryName: null,
            ),
          ),
        );
      case 'location':
        emit(
          state.copyWith(
            filters: state.filters.copyWith(
              locationId: null,
              locationName: null,
            ),
          ),
        );
      case 'condition':
        emit(state.copyWith(filters: state.filters.copyWith(conditions: [])));
      case 'price':
        emit(
          state.copyWith(
            filters: state.filters.copyWith(
              priceMinUsd: null,
              priceMaxUsd: null,
              priceMinIls: null,
              priceMaxIls: null,
            ),
          ),
        );
      case 'sort':
        emit(
          state.copyWith(
            filters: state.filters.copyWith(sort: SearchSortOption.newest),
          ),
        );
    }
    search();
  }

  @override
  Future<void> close() {
    _bookmarkSub.cancel();
    searchController.dispose();
    return super.close();
  }
}
