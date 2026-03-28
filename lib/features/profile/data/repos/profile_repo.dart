import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/community/data/models/posts_response.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import '../models/user_profile_model.dart';
import '../services/profile_api_service.dart';

class ListingsResponse {
  final List<ListingModel> listings;
  final bool hasMore;
  const ListingsResponse({required this.listings, required this.hasMore});
}

class ProfileRepo {
  final ProfileApiService _service;

  ProfileRepo(this._service);

  Future<ApiResult<UserProfileModel>> fetchUserProfile(String userId) async {
    try {
      final raw = await _service.fetchUserProfile(userId);
      if (raw == null) {
        return ApiResult.failure(
          ErrorHandler.handle(Exception('User not found')),
        );
      }
      return ApiResult.success(UserProfileModel.fromJson(raw));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<PostsResponse>> fetchUserPosts(
    String userId,
    int page,
  ) async {
    try {
      final raw = await _service.fetchUserPosts(userId, page);
      final hasMore = raw.length > ProfileApiService.postsPageSize;
      final items = hasMore
          ? raw.sublist(0, ProfileApiService.postsPageSize)
          : raw;
      final posts = items.map((e) => PostModel.fromJson(e)).toList();

      final postIds = posts.map((p) => p.postId).toList();
      final likedIds = await _service.fetchLikedPostIds(postIds);
      final bookmarkedIds = await _service.fetchBookmarkedPostIds(postIds);

      final enriched = posts
          .map(
            (p) => p.copyWith(
              isLiked: likedIds.contains(p.postId),
              isBookmarked: bookmarkedIds.contains(p.postId),
            ),
          )
          .toList();

      return ApiResult.success(
        PostsResponse(posts: enriched, hasMore: hasMore),
      );
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<ListingsResponse>> fetchUserListings(
    String userId,
    int page,
  ) async {
    try {
      final raw = await _service.fetchUserListings(userId, page);
      final hasMore = raw.length > ProfileApiService.listingsPageSize;
      final items = hasMore
          ? raw.sublist(0, ProfileApiService.listingsPageSize)
          : raw;
      final listings = items.map((e) => ListingModel.fromJson(e)).toList();
      return ApiResult.success(
        ListingsResponse(listings: listings, hasMore: hasMore),
      );
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<bool>> togglePostBookmark(String postId) async {
    try {
      final result = await _service.togglePostBookmark(postId);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<String?>> fetchVerificationStatus(String userId) async {
    try {
      final status = await _service.fetchVerificationStatus(userId);
      return ApiResult.success(status);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> softDeleteListing(String listingId) async {
    try {
      await _service.softDeleteListing(listingId);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
