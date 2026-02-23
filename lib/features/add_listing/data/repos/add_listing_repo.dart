import 'dart:io';

import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:gaza_tech/features/add_listing/data/models/location_model.dart';
import 'package:gaza_tech/features/add_listing/data/services/add_listing_api_service.dart';
import 'package:gaza_tech/features/marketplace/data/models/category_model.dart';

class AddListingRepo {
  final AddListingApiService _apiService;

  AddListingRepo(this._apiService);

  /// Fetch categories from marketplace_categories table
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

  /// Fetch locations from locations table
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

  /// Create a new listing
  Future<ApiResult<Map<String, dynamic>>> createListing(
      Map<String, dynamic> data) async {
    try {
      final result = await _apiService.createListing(data);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Upload images to Supabase Storage and return public URLs
  Future<ApiResult<List<String>>> uploadImages({
    required String sellerId,
    required String listingId,
    required List<File> images,
  }) async {
    try {
      final urls = <String>[];
      for (int i = 0; i < images.length; i++) {
        final url = await _apiService.uploadImage(
          sellerId: sellerId,
          listingId: listingId,
          file: images[i],
          index: i,
        );
        urls.add(url);
      }
      return ApiResult.success(urls);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Save image records to listing_images table
  Future<ApiResult<void>> saveListingImages({
    required String listingId,
    required List<String> imageUrls,
  }) async {
    try {
      await _apiService.saveListingImages(
        listingId: listingId,
        imageUrls: imageUrls,
      );
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
