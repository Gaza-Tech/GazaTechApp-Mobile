import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import '../services/listing_details_api_service.dart';

class ListingDetailsRepo {
  final ListingDetailsApiService _apiService;

  ListingDetailsRepo(this._apiService);

  /// Fetch a single listing with full details
  Future<ApiResult<ListingDetailModel>> getListingById(String listingId) async {
    try {
      final data = await _apiService.fetchListingById(listingId);
      final listing = ListingDetailModel.fromJson(data);
      return ApiResult.success(listing);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Fetch similar listings (same category)
  Future<ApiResult<List<ListingModel>>> getSimilarListings({
    required String categoryId,
    required String excludeListingId,
  }) async {
    try {
      final data = await _apiService.fetchSimilarListings(
        categoryId: categoryId,
        excludeListingId: excludeListingId,
      );
      final listings = data.map((json) => ListingModel.fromJson(json)).toList();
      return ApiResult.success(listings);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Fetch other listings from the same seller
  Future<ApiResult<List<ListingModel>>> getSellerListings({
    required String sellerId,
    required String excludeListingId,
  }) async {
    try {
      final data = await _apiService.fetchSellerListings(
        sellerId: sellerId,
        excludeListingId: excludeListingId,
      );
      final listings = data.map((json) => ListingModel.fromJson(json)).toList();
      return ApiResult.success(listings);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Increment view count (fire and forget)
  Future<void> incrementViewCount(String listingId) async {
    try {
      await _apiService.incrementViewCount(listingId);
    } catch (_) {
      // Silently ignore - view count is not critical
    }
  }
}
