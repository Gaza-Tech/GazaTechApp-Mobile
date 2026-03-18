import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/marketplace/data/models/category_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/features/add_listing/data/models/location_model.dart';
import '../data/models/search_filters_model.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    @Default('') String keyword,
    @Default(SearchFiltersModel()) SearchFiltersModel filters,
    @Default([]) List<String> recentSearches,

    // Filter dropdown data
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<LocationModel> locations,
    @Default(false) bool isFilterDataLoading,

    // Search results
    @Default([]) List<ListingModel> results,
    @Default(0) int currentPage,
    @Default(true) bool hasMore,

    // Loading states
    @Default(false) bool isSearching,
    @Default(false) bool isLoadingMore,

    // Error
    String? errorMessage,
  }) = _SearchState;

  bool get hasResults => results.isNotEmpty;
  bool get isEmpty => !isSearching && results.isEmpty && keyword.isNotEmpty;
  bool get isInitial => keyword.isEmpty && !filters.hasActiveFilters;
  bool get hasError => errorMessage != null;
}
