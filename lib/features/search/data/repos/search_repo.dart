import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:gaza_tech/features/marketplace/data/models/category_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listings_response.dart';
import 'package:gaza_tech/features/add_listing/data/models/location_model.dart';
import '../models/search_filters_model.dart';
import '../services/search_api_service.dart';

class SearchRepo {
  final SearchApiService _apiService;

  SearchRepo(this._apiService);

  Future<ApiResult<List<CategoryModel>>> getCategories() async {
    try {
      final data = await _apiService.fetchCategories();
      final categories =
          data.map((json) => CategoryModel.fromJson(json)).toList();
      return ApiResult.success(categories);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<LocationModel>>> getLocations() async {
    try {
      final data = await _apiService.fetchLocations();
      final locations =
          data.map((json) => LocationModel.fromJson(json)).toList();
      return ApiResult.success(locations);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ListingsResponse>> searchListings({
    String? keyword,
    required SearchFiltersModel filters,
    required int page,
  }) async {
    try {
      final data = await _apiService.searchListings(
        keyword: keyword,
        categoryId: filters.categoryId,
        locationId: filters.locationId,
        conditions: filters.conditions.isEmpty ? null : filters.conditions,
        priceMin: filters.priceMin,
        priceMax: filters.priceMax,
        sort: filters.sort,
        page: page,
      );

      final hasMore = data.length > SearchApiService.pageSize;
      final items =
          hasMore ? data.sublist(0, SearchApiService.pageSize) : data;
      final listings =
          items.map((json) => ListingModel.fromJson(json)).toList();

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
