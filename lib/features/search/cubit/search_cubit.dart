import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/cache/shared_pref_keys.dart';
import 'package:gaza_tech/core/helpers/shared_pref_helper.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/models/search_filters_model.dart';
import '../data/repos/search_repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;

  final TextEditingController searchController = TextEditingController();

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

  Future<void> loadRecentSearches() async {
    final raw = await SharedPrefHelper.getString(
        SharedPrefKeys.marketplaceRecentSearches);
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

    emit(state.copyWith(
      keyword: keyword,
      isSearching: true,
      results: [],
      currentPage: 0,
      hasMore: true,
      errorMessage: null,
      recentSearches: updatedRecentSearches,
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

  /// Apply filter and re-search
  void updateFilter(SearchFiltersModel filter) {
    emit(state.copyWith(filters: filter));
    search();
  }

  /// Clear search text and reset to initial state
  void clearSearch() {
    searchController.clear();
    emit(state.copyWith(
      keyword: '',
      results: [],
      currentPage: 0,
      hasMore: true,
      isSearching: false,
      errorMessage: null,
    ));
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
    emit(state.copyWith(filters: const SearchFiltersModel()));
    if (state.keyword.isNotEmpty) search();
  }

  /// Clear a specific filter type and re-search
  void clearFilter(String type) {
    switch (type) {
      case 'category':
        emit(state.copyWith(
          filters: state.filters.copyWith(
            categoryId: null,
            categoryName: null,
          ),
        ));
      case 'location':
        emit(state.copyWith(
          filters: state.filters.copyWith(
            locationId: null,
            locationName: null,
          ),
        ));
      case 'condition':
        emit(state.copyWith(
          filters: state.filters.copyWith(conditions: []),
        ));
      case 'price':
        emit(state.copyWith(
          filters: state.filters.copyWith(
            priceMinUsd: null,
            priceMaxUsd: null,
            priceMinIls: null,
            priceMaxIls: null,
          ),
        ));
      case 'sort':
        emit(state.copyWith(
          filters: state.filters.copyWith(sort: SearchSortOption.newest),
        ));
    }
    search();
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
