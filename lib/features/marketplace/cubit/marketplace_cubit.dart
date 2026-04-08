import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/services/post_event_service.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/marketplace_sort.dart';
import '../data/repos/marketplace_repo.dart';
import 'marketplace_state.dart';

class MarketplaceCubit extends Cubit<MarketplaceState> {
  final MarketplaceRepo _repo;
  final PostEventService _bookmarkEventService;
  late final StreamSubscription<ListingBookmarkEvent> _bookmarkSub;

  MarketplaceCubit(this._repo, this._bookmarkEventService)
    : super(const MarketplaceState()) {
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

  /// Fetch categories from the database
  Future<void> fetchCategories() async {
    if (state.categories.isNotEmpty) return;

    emit(state.copyWith(isCategoriesLoading: true));

    final result = await _repo.getCategories();

    result.when(
      success: (categories) {
        emit(
          state.copyWith(categories: categories, isCategoriesLoading: false),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isCategoriesLoading: false,
            errorMessage: error.message ?? 'Failed to load categories',
          ),
        );
      },
    );
  }

  /// Change selected category
  void changeCategory(String categorySlug) {
    if (state.selectedCategory == categorySlug) return;
    emit(state.copyWith(selectedCategory: categorySlug));
  }

  /// Fetch listings if not already cached for the given category
  Future<void> fetchIfNeeded(String category) async {
    if (state.listingsByCategory.containsKey(category) &&
        state.listingsByCategory[category]!.isNotEmpty) {
      return;
    }

    await fetchListings(category);
  }

  /// Fetch listings for a specific category (initial load or refresh)
  Future<void> fetchListings(String category) async {
    emit(state.copyWith(isInitialLoading: true, errorMessage: null));

    final categoryId = state.categoryIdFor(category);

    final result = await _repo.getListingsByCategory(
      categoryId: categoryId,
      page: 0,
      sort: state.activeSort,
    );

    result.when(
      success: (response) {
        final updatedListings = Map<String, List<ListingModel>>.from(
          state.listingsByCategory,
        )..[category] = response.listings;

        final updatedPages = Map<String, int>.from(state.currentPageByCategory)
          ..[category] = 0;

        final updatedHasMore = Map<String, bool>.from(state.hasMoreByCategory)
          ..[category] = response.hasMore;

        final updatedCounts = Map<String, int>.from(state.totalCountByCategory)
          ..[category] = response.totalCount;

        final fetchedIds =
            response.listings.map((l) => l.listingId).toSet();
        final newBookmarkedIds = response.listings
            .where((l) => l.isBookmarked)
            .map((l) => l.listingId)
            .toSet();
        final cleanedIds = state.bookmarkedListingIds.difference(fetchedIds);

        emit(
          state.copyWith(
            listingsByCategory: updatedListings,
            currentPageByCategory: updatedPages,
            hasMoreByCategory: updatedHasMore,
            totalCountByCategory: updatedCounts,
            isInitialLoading: false,
            errorMessage: null,
            bookmarkedListingIds: {...cleanedIds, ...newBookmarkedIds},
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isInitialLoading: false,
            errorMessage: error.message ?? 'Failed to load listings',
          ),
        );
      },
    );
  }

  /// Fetch more listings for pagination
  Future<void> fetchMore(String category) async {
    if (state.isLoadingMore || !state.hasMoreFor(category)) return;

    final nextPage = state.currentPageFor(category) + 1;

    emit(state.copyWith(isLoadingMore: true));

    final categoryId = state.categoryIdFor(category);

    final result = await _repo.getListingsByCategory(
      categoryId: categoryId,
      page: nextPage,
      sort: state.activeSort,
    );

    result.when(
      success: (response) {
        final currentListings = state.listingsByCategory[category] ?? [];
        final updatedListings = Map<String, List<ListingModel>>.from(
          state.listingsByCategory,
        )..[category] = [...currentListings, ...response.listings];

        final updatedPages = Map<String, int>.from(state.currentPageByCategory)
          ..[category] = nextPage;

        final updatedHasMore = Map<String, bool>.from(state.hasMoreByCategory)
          ..[category] = response.hasMore;

        final fetchedIds =
            response.listings.map((l) => l.listingId).toSet();
        final newBookmarkedIds = response.listings
            .where((l) => l.isBookmarked)
            .map((l) => l.listingId)
            .toSet();
        final cleanedIds = state.bookmarkedListingIds.difference(fetchedIds);

        emit(
          state.copyWith(
            listingsByCategory: updatedListings,
            currentPageByCategory: updatedPages,
            hasMoreByCategory: updatedHasMore,
            isLoadingMore: false,
            bookmarkedListingIds: {...cleanedIds, ...newBookmarkedIds},
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isLoadingMore: false,
            errorMessage: error.message ?? 'Failed to load more listings',
          ),
        );
      },
    );
  }

  /// Toggle bookmark for a listing (optimistic update)
  Future<void> toggleBookmark(String listingId) async {
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
        // Revert on failure
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

  /// Reset pagination for a specific category (for pull-to-refresh)
  void resetPagination(String category) {
    final updatedPages = Map<String, int>.from(state.currentPageByCategory)
      ..remove(category);

    final updatedHasMore = Map<String, bool>.from(state.hasMoreByCategory)
      ..remove(category);

    emit(
      state.copyWith(
        currentPageByCategory: updatedPages,
        hasMoreByCategory: updatedHasMore,
      ),
    );
  }

  /// Update sort order and re-fetch all listings
  Future<void> updateSort(MarketplaceSort sort) async {
    if (state.activeSort == sort) return;

    emit(
      state.copyWith(
        activeSort: sort,
        listingsByCategory: {},
        currentPageByCategory: {},
        hasMoreByCategory: {},
        totalCountByCategory: {},
      ),
    );

    await fetchListings(state.selectedCategory);
  }

  /// Clear all cached data
  void clearCache() {
    emit(const MarketplaceState());
  }

  @override
  Future<void> close() {
    _bookmarkSub.cancel();
    return super.close();
  }
}
