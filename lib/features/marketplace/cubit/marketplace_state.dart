import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/category_model.dart';
import '../data/models/listing_model.dart';
import '../data/models/marketplace_sort.dart';

part 'marketplace_state.freezed.dart';

@freezed
abstract class MarketplaceState with _$MarketplaceState {
  const factory MarketplaceState({
    // Current category being viewed (slug-based key: 'all', or actual slug from DB)
    @Default('all') String selectedCategory,

    // Categories fetched from DB
    @Default([]) List<CategoryModel> categories,
    @Default(false) bool isCategoriesLoading,

    // Listings data per category (cached)
    @Default({}) Map<String, List<ListingModel>> listingsByCategory,

    // Pagination state per category
    @Default({}) Map<String, int> currentPageByCategory,
    @Default({}) Map<String, bool> hasMoreByCategory,

    // Loading states
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,

    // Sort
    @Default(MarketplaceSort.newest) MarketplaceSort activeSort,

    // Error state
    String? errorMessage,

    // Total count per category
    @Default({}) Map<String, int> totalCountByCategory,
  }) = _MarketplaceState;

  const MarketplaceState._();

  // Helper getters
  List<CategoryModel> get allCategories => categories;

  List<ListingModel> get currentListings =>
      listingsByCategory[selectedCategory] ?? [];

  bool get hasMore => hasMoreByCategory[selectedCategory] ?? true;

  int get currentPage => currentPageByCategory[selectedCategory] ?? 0;

  bool get isError => errorMessage != null;

  bool get isEmpty => !isInitialLoading && currentListings.isEmpty;

  /// Get the UUID for the currently selected category (null for 'all')
  String? get selectedCategoryId {
    if (selectedCategory == 'all') return null;
    final match = categories.where((c) => c.slug == selectedCategory);
    return match.isNotEmpty ? match.first.id : null;
  }

  // Per-category helpers (for independent tab state)
  List<ListingModel> listingsFor(String category) =>
      listingsByCategory[category] ?? [];

  bool hasMoreFor(String category) => hasMoreByCategory[category] ?? true;

  int currentPageFor(String category) => currentPageByCategory[category] ?? 0;

  String? categoryIdFor(String categorySlug) {
    if (categorySlug == 'all') return null;
    final match = categories.where((c) => c.slug == categorySlug);
    return match.isNotEmpty ? match.first.id : null;
  }
}
