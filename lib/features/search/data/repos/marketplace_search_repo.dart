import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:gaza_tech/features/marketplace/data/models/category_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listings_response.dart';
import 'package:gaza_tech/features/add_listing/data/models/location_model.dart';
import '../models/marketplace_search_filters_model.dart';
import '../services/search_api_service.dart';

class MarketplaceSearchRepo {
  final MarketplaceSearchApiService _apiService;

  MarketplaceSearchRepo(this._apiService);

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

  Future<ApiResult<List<LocationModel>>> getLocations() async {
    try {
      final data = await _apiService.fetchLocations();
      final locations = data
          .map((json) => LocationModel.fromJson(json))
          .toList();
      return ApiResult.success(locations);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ListingsResponse>> searchListings({
    String? keyword,
    required MarketplaceSearchFiltersModel filters,
    required int page,
  }) async {
    try {
      final data = await _apiService.searchListings(
        keyword: keyword,
        categoryId: filters.categoryId,
        locationId: filters.locationId,
        conditions: filters.conditions.isEmpty ? null : filters.conditions,
        priceMinUsd: filters.priceMinUsd,
        priceMaxUsd: filters.priceMaxUsd,
        priceMinIls: filters.priceMinIls,
        priceMaxIls: filters.priceMaxIls,
        sort: filters.sort,
        page: page,
      );

      final hasMore = data.length > MarketplaceSearchApiService.pageSize;
      final items = hasMore
          ? data.sublist(0, MarketplaceSearchApiService.pageSize)
          : data;
      final listings = items
          .map((json) => ListingModel.fromJson(json))
          .toList();

      return ApiResult.success(
        ListingsResponse(
          listings: listings,
          totalCount: listings.length,
          hasMore: hasMore,
        ),
      );
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
