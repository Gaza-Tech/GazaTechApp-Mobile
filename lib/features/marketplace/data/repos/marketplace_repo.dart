import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import '../models/category_model.dart';
import '../models/listing_model.dart';
import '../models/listings_response.dart';
import '../models/marketplace_sort.dart';
import '../services/marketplace_api_service.dart';

class MarketplaceRepo {
  final MarketplaceApiService _apiService;

  MarketplaceRepo(this._apiService);

  /// Fetch categories from marketplace_categories table
  Future<ApiResult<List<CategoryModel>>> getCategories() async {
    try {
      final data = await _apiService.fetchCategories();
      final categories = data
          .map((json) => CategoryModel.fromJson(json))
          .toList();
      return ApiResult.success(categories);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Fetch listings by category with pagination
  /// [categoryId] is the UUID or null for 'all'
  Future<ApiResult<ListingsResponse>> getListingsByCategory({
    required String? categoryId,
    required int page,
    MarketplaceSort sort = MarketplaceSort.newest,
  }) async {
    try {
      final data = await _apiService.fetchListingsByCategory(
        categoryId: categoryId,
        page: page,
        sort: sort,
      );

      // Check if we got more items than pageSize (means there are more pages)
      final hasMore = data.length > MarketplaceApiService.pageSize;

      // Only take pageSize items (remove the extra one used for hasMore check)
      final items = hasMore
          ? data.sublist(0, MarketplaceApiService.pageSize)
          : data;

      final listings = items
          .map((json) => ListingModel.fromJson(json))
          .toList();

      final listingIds = listings.map((l) => l.listingId).toList();
      final bookmarkedIds = await _apiService.fetchBookmarkedListingIds(
        listingIds,
      );
      final enriched = listings
          .map(
            (l) =>
                l.copyWith(isBookmarked: bookmarkedIds.contains(l.listingId)),
          )
          .toList();

      return ApiResult.success(
        ListingsResponse(
          listings: enriched,
          totalCount: enriched.length,
          hasMore: hasMore,
        ),
      );
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Search listings
  Future<ApiResult<ListingsResponse>> searchListings({
    required String keyword,
    required int page,
  }) async {
    try {
      final data = await _apiService.searchListings(
        keyword: keyword,
        page: page,
      );

      // Check if we got more items than pageSize (means there are more pages)
      final hasMore = data.length > MarketplaceApiService.pageSize;

      // Only take pageSize items (remove the extra one used for hasMore check)
      final items = hasMore
          ? data.sublist(0, MarketplaceApiService.pageSize)
          : data;

      final listings = items
          .map((json) => ListingModel.fromJson(json))
          .toList();

      final listingIds = listings.map((l) => l.listingId).toList();
      final bookmarkedIds = await _apiService.fetchBookmarkedListingIds(
        listingIds,
      );
      final enriched = listings
          .map(
            (l) =>
                l.copyWith(isBookmarked: bookmarkedIds.contains(l.listingId)),
          )
          .toList();

      return ApiResult.success(
        ListingsResponse(
          listings: enriched,
          totalCount: enriched.length,
          hasMore: hasMore,
        ),
      );
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Toggle bookmark for a listing
  Future<ApiResult<bool>> toggleListingBookmark(String listingId) async {
    try {
      final result = await _apiService.toggleListingBookmark(listingId);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
