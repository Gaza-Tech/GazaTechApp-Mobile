import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/models/search_filters_model.dart';
import '../data/repos/search_repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;

  final TextEditingController searchController = TextEditingController();
  final TextEditingController priceMinUsdController = TextEditingController();
  final TextEditingController priceMaxUsdController = TextEditingController();
  final TextEditingController priceMinIlsController = TextEditingController();
  final TextEditingController priceMaxIlsController = TextEditingController();

  SearchCubit(this._repo) : super(const SearchState());

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
            emit(state.copyWith(
              categories: categories,
              locations: locations,
              isFilterDataLoading: false,
            ));
          },
          failure: (error) {
            emit(state.copyWith(
              isFilterDataLoading: false,
              errorMessage: error.message,
            ));
          },
        );
      },
      failure: (error) {
        emit(state.copyWith(
          isFilterDataLoading: false,
          errorMessage: error.message,
        ));
      },
    );
  }

  /// Execute search (fresh, page 0)
  Future<void> search() async {
    final keyword = searchController.text.trim();

    if (keyword.isEmpty && !state.filters.hasActiveFilters) return;

    emit(state.copyWith(
      keyword: keyword,
      isSearching: true,
      results: [],
      currentPage: 0,
      hasMore: true,
      errorMessage: null,
    ));

    final result = await _repo.searchListings(
      keyword: keyword.isEmpty ? null : keyword,
      filters: state.filters,
      page: 0,
    );

    result.when(
      success: (response) {
        emit(state.copyWith(
          results: response.listings,
          hasMore: response.hasMore,
          currentPage: 0,
          isSearching: false,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          isSearching: false,
          errorMessage: error.message,
        ));
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
        emit(state.copyWith(
          results: [...state.results, ...response.listings],
          hasMore: response.hasMore,
          currentPage: nextPage,
          isLoadingMore: false,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          isLoadingMore: false,
          errorMessage: error.message,
        ));
      },
    );
  }

  /// Toggle a condition in the filter
  void toggleCondition(String condition) {
    final current = List<String>.from(state.filters.conditions);
    if (current.contains(condition)) {
      current.remove(condition);
    } else {
      current.add(condition);
    }
    emit(state.copyWith(
      filters: state.filters.copyWith(conditions: current),
    ));
  }

  /// Set category filter
  void setCategory(String? categoryId, String? categoryName) {
    emit(state.copyWith(
      filters: state.filters.copyWith(
        categoryId: categoryId,
        categoryName: categoryName,
      ),
    ));
  }

  /// Set location filter
  void setLocation(String? locationId, String? locationName) {
    emit(state.copyWith(
      filters: state.filters.copyWith(
        locationId: locationId,
        locationName: locationName,
      ),
    ));
  }

  /// Update sort option
  void updateSort(SearchSortOption sort) {
    emit(state.copyWith(
      filters: state.filters.copyWith(sort: sort),
    ));
  }

  /// Apply price range from controllers
  void _applyPriceRange() {
    final minUsd = int.tryParse(priceMinUsdController.text);
    final maxUsd = int.tryParse(priceMaxUsdController.text);
    final minIls = int.tryParse(priceMinIlsController.text);
    final maxIls = int.tryParse(priceMaxIlsController.text);
    emit(state.copyWith(
      filters: state.filters.copyWith(
        priceMinUsd: minUsd,
        priceMaxUsd: maxUsd,
        priceMinIls: minIls,
        priceMaxIls: maxIls,
      ),
    ));
  }

  /// Apply all current filter settings and run search
  void applyFiltersAndSearch() {
    _applyPriceRange();
    search();
  }

  /// Clear all filters and re-search
  void clearFilters() {
    priceMinUsdController.clear();
    priceMaxUsdController.clear();
    priceMinIlsController.clear();
    priceMaxIlsController.clear();
    emit(state.copyWith(filters: const SearchFiltersModel()));
    if (state.keyword.isNotEmpty) search();
  }

  /// Clear a specific filter type and re-search
  void clearFilter(String type) {
    switch (type) {
      case 'category':
        setCategory(null, null);
      case 'location':
        setLocation(null, null);
      case 'condition':
        emit(state.copyWith(
          filters: state.filters.copyWith(conditions: []),
        ));
      case 'price':
        priceMinUsdController.clear();
        priceMaxUsdController.clear();
        priceMinIlsController.clear();
        priceMaxIlsController.clear();
        emit(state.copyWith(
          filters: state.filters.copyWith(
            priceMinUsd: null,
            priceMaxUsd: null,
            priceMinIls: null,
            priceMaxIls: null,
          ),
        ));
    }
    search();
  }

  @override
  Future<void> close() {
    searchController.dispose();
    priceMinUsdController.dispose();
    priceMaxUsdController.dispose();
    priceMinIlsController.dispose();
    priceMaxIlsController.dispose();
    return super.close();
  }
}
