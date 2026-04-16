import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/community/data/models/posts_response.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import '../services/bookmarks_api_service.dart';

class BookmarksListingsResponse {
  final List<ListingModel> listings;
  final bool hasMore;
  const BookmarksListingsResponse({
    required this.listings,
    required this.hasMore,
  });
}

class BookmarksRepo {
  final BookmarksApiService _service;

  BookmarksRepo(this._service);

  Future<ApiResult<PostsResponse>> fetchBookmarkedPosts(int page) async {
    try {
      final raw = await _service.fetchBookmarkedPosts(page);
      final hasMore = raw.length > BookmarksApiService.postsPageSize;
      final items = hasMore
          ? raw.sublist(0, BookmarksApiService.postsPageSize)
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

  Future<ApiResult<BookmarksListingsResponse>> fetchBookmarkedListings(
    int page,
  ) async {
    try {
      final raw = await _service.fetchBookmarkedListings(page);
      final hasMore = raw.length > BookmarksApiService.listingsPageSize;
      final items = hasMore
          ? raw.sublist(0, BookmarksApiService.listingsPageSize)
          : raw;
      final listings = items.map((e) => ListingModel.fromJson(e)).toList();

      final listingIds = listings.map((l) => l.listingId).toList();
      final bookmarkedIds = await _service.fetchBookmarkedListingIds(
        listingIds,
      );
      final enriched = listings
          .map(
            (l) =>
                l.copyWith(isBookmarked: bookmarkedIds.contains(l.listingId)),
          )
          .toList();

      return ApiResult.success(
        BookmarksListingsResponse(listings: enriched, hasMore: hasMore),
      );
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<bool>> togglePostBookmark(String postId) async {
    try {
      return ApiResult.success(await _service.togglePostBookmark(postId));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<bool>> toggleListingBookmark(String listingId) async {
    try {
      return ApiResult.success(await _service.toggleListingBookmark(listingId));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<bool>> togglePostLike(String postId) async {
    try {
      return ApiResult.success(await _service.togglePostLike(postId));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
