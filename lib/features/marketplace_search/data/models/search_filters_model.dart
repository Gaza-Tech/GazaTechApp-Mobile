import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_filters_model.freezed.dart';

enum SearchSortOption { newest, oldest, priceLowToHigh, priceHighToLow }

@freezed
abstract class SearchFiltersModel with _$SearchFiltersModel {
  const SearchFiltersModel._();

  const factory SearchFiltersModel({
    @Default(null) String? categoryId,
    @Default(null) String? categoryName,
    @Default(null) String? locationId,
    @Default(null) String? locationName,
    @Default([]) List<String> conditions,
    @Default(null) int? priceMinUsd,
    @Default(null) int? priceMaxUsd,
    @Default(null) int? priceMinIls,
    @Default(null) int? priceMaxIls,
    @Default(SearchSortOption.newest) SearchSortOption sort,
  }) = _SearchFiltersModel;

  bool get hasActiveFilters =>
      categoryId != null ||
      locationId != null ||
      conditions.isNotEmpty ||
      priceMinUsd != null ||
      priceMaxUsd != null ||
      priceMinIls != null ||
      priceMaxIls != null;

  bool get hasPriceFilter =>
      priceMinUsd != null ||
      priceMaxUsd != null ||
      priceMinIls != null ||
      priceMaxIls != null;

  int get activeFilterCount {
    int count = 0;
    if (categoryId != null) count++;
    if (locationId != null) count++;
    if (conditions.isNotEmpty) count++;
    if (hasPriceFilter) count++;
    return count;
  }
}
