import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/marketplace/data/models/category_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/features/add_listing/data/models/location_model.dart';
import '../data/models/marketplace_search_filters_model.dart';

part 'marketplace_search_state.freezed.dart';

@freezed
abstract class MarketplaceSearchState with _$MarketplaceSearchState {
  const MarketplaceSearchState._();

  const factory MarketplaceSearchState({
    @Default('') String keyword,
    @Default(MarketplaceSearchFiltersModel())
    MarketplaceSearchFiltersModel filters,
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

    // Bookmark tracking
    @Default(<String>{}) Set<String> bookmarkedListingIds,
  }) = _MarketplaceSearchState;

  bool get hasResults => results.isNotEmpty;
  bool get isEmpty => !isSearching && results.isEmpty && keyword.isNotEmpty;
  bool get isInitial => keyword.isEmpty && !filters.hasActiveFilters;
  bool get hasError => errorMessage != null;
}
