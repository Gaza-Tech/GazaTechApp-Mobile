import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_filters_model.freezed.dart';

enum SearchSortOption { newest, priceLowToHigh, priceHighToLow }

@freezed
abstract class SearchFiltersModel with _$SearchFiltersModel {
  const SearchFiltersModel._();

  const factory SearchFiltersModel({
    @Default(null) String? categoryId,
    @Default(null) String? categoryName,
    @Default(null) String? locationId,
    @Default(null) String? locationName,
    @Default([]) List<String> conditions,
    @Default(null) int? priceMin,
    @Default(null) int? priceMax,
    @Default(SearchSortOption.newest) SearchSortOption sort,
  }) = _SearchFiltersModel;

  bool get hasActiveFilters =>
      categoryId != null ||
      locationId != null ||
      conditions.isNotEmpty ||
      priceMin != null ||
      priceMax != null;

  int get activeFilterCount {
    int count = 0;
    if (categoryId != null) count++;
    if (locationId != null) count++;
    if (conditions.isNotEmpty) count++;
    if (priceMin != null || priceMax != null) count++;
    return count;
  }
}
