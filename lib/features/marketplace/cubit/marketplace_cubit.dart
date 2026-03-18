import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/marketplace_sort.dart';
import '../data/repos/marketplace_repo.dart';
import 'marketplace_state.dart';

class MarketplaceCubit extends Cubit<MarketplaceState> {
  final MarketplaceRepo _repo;

  MarketplaceCubit(this._repo) : super(const MarketplaceState());

  /// Fetch categories from the database
  Future<void> fetchCategories() async {
    if (state.categories.isNotEmpty) return;

    emit(state.copyWith(isCategoriesLoading: true));

    final result = await _repo.getCategories();

    result.when(
      success: (categories) {
        emit(state.copyWith(
          categories: categories,
          isCategoriesLoading: false,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          isCategoriesLoading: false,
          errorMessage: error.message ?? 'Failed to load categories',
        ));
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
    emit(state.copyWith(
      isInitialLoading: true,
      errorMessage: null,
    ));

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

        final updatedPages = Map<String, int>.from(
          state.currentPageByCategory,
        )..[category] = 0;

        final updatedHasMore = Map<String, bool>.from(
          state.hasMoreByCategory,
        )..[category] = response.hasMore;

        final updatedCounts = Map<String, int>.from(
          state.totalCountByCategory,
        )..[category] = response.totalCount;

        emit(state.copyWith(
          listingsByCategory: updatedListings,
          currentPageByCategory: updatedPages,
          hasMoreByCategory: updatedHasMore,
          totalCountByCategory: updatedCounts,
          isInitialLoading: false,
          errorMessage: null,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          isInitialLoading: false,
          errorMessage: error.message ?? 'Failed to load listings',
        ));
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

        final updatedPages = Map<String, int>.from(
          state.currentPageByCategory,
        )..[category] = nextPage;

        final updatedHasMore = Map<String, bool>.from(
          state.hasMoreByCategory,
        )..[category] = response.hasMore;

        emit(state.copyWith(
          listingsByCategory: updatedListings,
          currentPageByCategory: updatedPages,
          hasMoreByCategory: updatedHasMore,
          isLoadingMore: false,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          isLoadingMore: false,
          errorMessage: error.message ?? 'Failed to load more listings',
        ));
      },
    );
  }

  /// Reset pagination for a specific category (for pull-to-refresh)
  void resetPagination(String category) {
    final updatedPages = Map<String, int>.from(
      state.currentPageByCategory,
    )..remove(category);

    final updatedHasMore = Map<String, bool>.from(
      state.hasMoreByCategory,
    )..remove(category);

    emit(state.copyWith(
      currentPageByCategory: updatedPages,
      hasMoreByCategory: updatedHasMore,
    ));
  }

  /// Update sort order and re-fetch all listings
  Future<void> updateSort(MarketplaceSort sort) async {
    if (state.activeSort == sort) return;

    emit(state.copyWith(
      activeSort: sort,
      listingsByCategory: {},
      currentPageByCategory: {},
      hasMoreByCategory: {},
      totalCountByCategory: {},
    ));

    await fetchListings(state.selectedCategory);
  }

  /// Clear all cached data
  void clearCache() {
    emit(const MarketplaceState());
  }
}
