import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/netowoks/supabase_error_handler.dart';
import 'package:gaza_tech/features/community_search/data/models/search_filter.dart';
import '../models/community_sort.dart';
import '../models/post_model.dart';
import '../models/comment_model.dart';
import '../models/posts_response.dart';
import '../services/community_api_service.dart';

class CommunityRepo {
  final CommunityApiService _service;

  CommunityRepo(this._service);

  Future<ApiResult<PostsResponse>> fetchPosts({
    String? category,
    required int page,
    CommunitySort sort = CommunitySort.newest,
  }) async {
    try {
      final raw = await _service.fetchPosts(
        category: category,
        page: page,
        sort: sort,
      );
      final hasMore = raw.length > CommunityApiService.postsPageSize;
      final items = hasMore
          ? raw.sublist(0, CommunityApiService.postsPageSize)
          : raw;
      final posts = items.map((e) => PostModel.fromJson(e)).toList();

      final postIds = posts.map((p) => p.postId).toList();
      final likedIds = await _service.fetchLikedPostIds(postIds);
      final bookmarkedIds = await _service.fetchBookmarkedPostIds(postIds);

      final enrichedPosts = posts
          .map(
            (p) => p.copyWith(
              isLiked: likedIds.contains(p.postId),
              isBookmarked: bookmarkedIds.contains(p.postId),
            ),
          )
          .toList();

      return ApiResult.success(
        PostsResponse(posts: enrichedPosts, hasMore: hasMore),
      );
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<PostModel>> fetchPostDetails(String postId) async {
    try {
      final raw = await _service.fetchPostDetails(postId);
      if (raw == null) {
        return ApiResult.failure(
          ErrorHandler.handle(Exception('Post not found')),
        );
      }
      final post = PostModel.fromJson(raw);
      final isLiked = await _service.isPostLiked(postId);
      final isBookmarked = await _service.isPostBookmarked(postId);

      return ApiResult.success(
        post.copyWith(isLiked: isLiked, isBookmarked: isBookmarked),
      );
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CommentsResponse>> fetchComments({
    required String postId,
    required int page,
  }) async {
    try {
      final raw = await _service.fetchComments(postId: postId, page: page);
      final hasMore = raw.length > CommunityApiService.commentsPageSize;
      final items = hasMore
          ? raw.sublist(0, CommunityApiService.commentsPageSize)
          : raw;
      final comments = items.map((e) => CommentModel.fromJson(e)).toList();
      return ApiResult.success(
        CommentsResponse(comments: comments, hasMore: hasMore),
      );
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<bool>> togglePostLike(String postId) async {
    try {
      final isLiked = await _service.togglePostLike(postId);
      return ApiResult.success(isLiked);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<bool>> toggleCommentLike(String commentId) async {
    try {
      final isLiked = await _service.toggleCommentLike(commentId);
      return ApiResult.success(isLiked);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<bool>> toggleBookmark(String postId) async {
    try {
      final isBookmarked = await _service.toggleBookmark(postId);
      return ApiResult.success(isBookmarked);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> createPost({
    required String title,
    required String content,
    required String category,
  }) async {
    try {
      await _service.createPost(
        title: title,
        content: content,
        category: category,
      );
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<CommentModel>>> fetchReplies({
    required String parentCommentId,
  }) async {
    try {
      final raw = await _service.fetchReplies(parentCommentId: parentCommentId);
      final replies = raw.map((e) => CommentModel.fromJson(e)).toList();
      return ApiResult.success(replies);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<PostsResponse>> searchPosts({
    required String keyword,
    required int page,
    SearchFilter filter = const SearchFilter(),
  }) async {
    try {
      DateTime? dateAfter = filter.dateRange?.cutoffDate;
      int? minLikes;
      int? minComments;
      for (final level in filter.engagementLevels) {
        if (level == EngagementLevel.likes100Plus) minLikes = 100;
        if (level == EngagementLevel.comments50Plus) minComments = 50;
      }

      final raw = await _service.searchPosts(
        keyword: keyword,
        page: page,
        categories: filter.categories.isEmpty
            ? null
            : filter.categories.toList(),
        dateAfter: dateAfter,
        minLikes: minLikes,
        minComments: minComments,
        sort: filter.sort,
      );
      final hasMore = raw.length > CommunityApiService.postsPageSize;
      final items = hasMore
          ? raw.sublist(0, CommunityApiService.postsPageSize)
          : raw;
      final posts = items.map((e) => PostModel.fromJson(e)).toList();

      final postIds = posts.map((p) => p.postId).toList();
      final likedIds = await _service.fetchLikedPostIds(postIds);
      final bookmarkedIds = await _service.fetchBookmarkedPostIds(postIds);

      final enrichedPosts = posts
          .map(
            (p) => p.copyWith(
              isLiked: likedIds.contains(p.postId),
              isBookmarked: bookmarkedIds.contains(p.postId),
            ),
          )
          .toList();

      return ApiResult.success(
        PostsResponse(posts: enrichedPosts, hasMore: hasMore),
      );
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> addComment({
    required String postId,
    required String content,
    String? parentCommentId,
  }) async {
    try {
      await _service.addComment(
        postId: postId,
        content: content,
        parentCommentId: parentCommentId,
      );
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
