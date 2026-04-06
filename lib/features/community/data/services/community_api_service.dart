import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/community_sort.dart';

class CommunityApiService {
  final SupabaseClient _supabase;

  CommunityApiService(this._supabase);

  static const int postsPageSize = 10;
  static const int commentsPageSize = 15;

  static const String _postSelect = '''
    post_id, author_id, title, content, post_category, content_status,
    created_at, published_at, likes_count, comments_count,
    users!author_id(user_id, first_name, last_name, avatar_url),
    community_posts_attachments(file_url)
  ''';

  static const String _commentSelect = '''
    comment_id, post_id, author_id, content, is_edited, created_at, parent_comment_id,
    users!author_id(user_id, first_name, last_name, avatar_url),
    community_comments_likes(count),
    community_post_comments!parent_comment_id(count)
  ''';

  Future<List<Map<String, dynamic>>> fetchPosts({
    String? category,
    required int page,
    CommunitySort sort = CommunitySort.newest,
  }) async {
    final startIndex = page * postsPageSize;
    final endIndex = startIndex + postsPageSize;

    var query = _supabase
        .from('community_posts_with_counts')
        .select(_postSelect)
        .eq('content_status', 'published');

    if (category != null && category != 'all') {
      query = query.eq('post_category', category);
    }

    final dynamic data;
    switch (sort) {
      case CommunitySort.newest:
        data = await query
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
      case CommunitySort.oldest:
        data = await query
            .order('created_at', ascending: true)
            .range(startIndex, endIndex);
      case CommunitySort.mostLiked:
        data = await query
            .order('likes_count', ascending: false)
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
      case CommunitySort.mostCommented:
        data = await query
            .order('comments_count', ascending: false)
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
    }

    return List<Map<String, dynamic>>.from(data as List);
  }

  Future<Set<String>> fetchLikedPostIds(List<String> postIds) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null || postIds.isEmpty) return {};

    final data = await _supabase
        .from('community_posts_likes')
        .select('post_id')
        .eq('user_id', userId)
        .inFilter('post_id', postIds);

    return {
      for (final e in (data as List<dynamic>))
        (e as Map<String, dynamic>)['post_id'] as String,
    };
  }

  Future<Set<String>> fetchBookmarkedPostIds(List<String> postIds) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null || postIds.isEmpty) return {};

    final data = await _supabase
        .from('bookmarked_posts')
        .select('post_id')
        .eq('user_id', userId)
        .inFilter('post_id', postIds);

    return {
      for (final e in (data as List<dynamic>))
        (e as Map<String, dynamic>)['post_id'] as String,
    };
  }

  Future<Set<String>> fetchReportedPostIds(List<String> postIds) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null || postIds.isEmpty) return {};

    final data = await _supabase
        .from('reports')
        .select('reported_post_id')
        .eq('reporter_id', userId)
        .inFilter('reported_post_id', postIds);

    return {
      for (final e in (data as List<dynamic>))
        (e as Map<String, dynamic>)['reported_post_id'] as String,
    };
  }

  Future<Set<String>> fetchReportedCommentIds(List<String> commentIds) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null || commentIds.isEmpty) return {};

    final data = await _supabase
        .from('reports')
        .select('reported_comment_id')
        .eq('reporter_id', userId)
        .inFilter('reported_comment_id', commentIds);

    return {
      for (final e in (data as List<dynamic>))
        (e as Map<String, dynamic>)['reported_comment_id'] as String,
    };
  }

  Future<Map<String, dynamic>?> fetchPostDetails(String postId) async {
    return await _supabase
        .from('community_posts_with_counts')
        .select(_postSelect)
        .eq('post_id', postId)
        .maybeSingle();
  }

  Future<bool> isPostLiked(String postId) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return false;

    final result = await _supabase
        .from('community_posts_likes')
        .select('user_id')
        .eq('user_id', userId)
        .eq('post_id', postId)
        .maybeSingle();

    return result != null;
  }

  Future<bool> isPostBookmarked(String postId) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return false;

    final result = await _supabase
        .from('bookmarked_posts')
        .select('user_id')
        .eq('user_id', userId)
        .eq('post_id', postId)
        .maybeSingle();

    return result != null;
  }

  Future<List<Map<String, dynamic>>> fetchComments({
    required String postId,
    required int page,
  }) async {
    final startIndex = page * commentsPageSize;
    final endIndex = startIndex + commentsPageSize;

    final data = await _supabase
        .from('community_post_comments')
        .select(_commentSelect)
        .eq('post_id', postId)
        .isFilter('parent_comment_id', null)
        .order('created_at', ascending: false)
        .range(startIndex, endIndex);

    return List<Map<String, dynamic>>.from(data);
  }

  Future<bool> togglePostLike(String postId) async {
    final userId = _supabase.auth.currentUser!.id;

    final existing = await _supabase
        .from('community_posts_likes')
        .select('user_id')
        .eq('user_id', userId)
        .eq('post_id', postId)
        .maybeSingle();

    if (existing != null) {
      await _supabase
          .from('community_posts_likes')
          .delete()
          .eq('user_id', userId)
          .eq('post_id', postId);
      return false;
    } else {
      await _supabase.from('community_posts_likes').insert({
        'user_id': userId,
        'post_id': postId,
      });
      return true;
    }
  }

  Future<bool> toggleCommentLike(String commentId) async {
    final userId = _supabase.auth.currentUser!.id;

    final existing = await _supabase
        .from('community_comments_likes')
        .select('user_id')
        .eq('user_id', userId)
        .eq('comment_id', commentId)
        .maybeSingle();

    if (existing != null) {
      await _supabase
          .from('community_comments_likes')
          .delete()
          .eq('user_id', userId)
          .eq('comment_id', commentId);
      return false;
    } else {
      await _supabase.from('community_comments_likes').insert({
        'user_id': userId,
        'comment_id': commentId,
      });
      return true;
    }
  }

  Future<bool> toggleBookmark(String postId) async {
    final userId = _supabase.auth.currentUser!.id;

    final existing = await _supabase
        .from('bookmarked_posts')
        .select('user_id')
        .eq('user_id', userId)
        .eq('post_id', postId)
        .maybeSingle();

    if (existing != null) {
      await _supabase
          .from('bookmarked_posts')
          .delete()
          .eq('user_id', userId)
          .eq('post_id', postId);
      return false;
    } else {
      await _supabase.from('bookmarked_posts').insert({
        'user_id': userId,
        'post_id': postId,
      });
      return true;
    }
  }

  Future<String> createPost({
    required String title,
    required String content,
    required String category,
  }) async {
    final userId = _supabase.auth.currentUser!.id;
    final result = await _supabase
        .from('community_posts')
        .insert({
          'author_id': userId,
          'title': title,
          'content': content,
          'post_category': category,
          'content_status': 'published',
          'published_at': DateTime.now().toIso8601String(),
        })
        .select('post_id')
        .single();
    return result['post_id'] as String;
  }

  /// Upload a single post image to Supabase Storage.
  Future<String> uploadPostImage({
    required String authorId,
    required String postId,
    required File file,
    required int index,
  }) async {
    final extension = file.path.split('.').last;
    final path = '$authorId/$postId/$index.$extension';

    await _supabase.storage.from('community-attachments').upload(path, file);

    return _supabase.storage.from('community-attachments').getPublicUrl(path);
  }

  /// Save attachment URL records to the database.
  Future<void> savePostAttachments({
    required String postId,
    required List<String> imageUrls,
  }) async {
    final records = imageUrls
        .map((url) => {'post_id': postId, 'file_url': url})
        .toList();

    await _supabase.from('community_posts_attachments').insert(records);
  }

  /// Delete all attachment records and storage files for a post.
  Future<void> deletePostAttachments({
    required String postId,
    required String authorId,
  }) async {
    await _supabase
        .from('community_posts_attachments')
        .delete()
        .eq('post_id', postId);

    final files = await _supabase.storage
        .from('community-attachments')
        .list(path: '$authorId/$postId');

    if (files.isNotEmpty) {
      final paths = files.map((f) => '$authorId/$postId/${f.name}').toList();
      await _supabase.storage.from('community-attachments').remove(paths);
    }
  }

  Future<List<Map<String, dynamic>>> fetchReplies({
    required String parentCommentId,
  }) async {
    final data = await _supabase
        .from('community_post_comments')
        .select(_commentSelect)
        .eq('parent_comment_id', parentCommentId)
        .order('created_at', ascending: true);
    return List<Map<String, dynamic>>.from(data);
  }

  Future<void> addComment({
    required String postId,
    required String content,
    String? parentCommentId,
  }) async {
    final userId = _supabase.auth.currentUser!.id;
    await _supabase.from('community_post_comments').insert({
      'post_id': postId,
      'author_id': userId,
      'content': content,
      if (parentCommentId != null) 'parent_comment_id': parentCommentId,
    });
  }

  Future<void> updatePost({
    required String postId,
    required Map<String, dynamic> data,
  }) async {
    await _supabase.from('community_posts').update(data).eq('post_id', postId);
  }

  Future<void> softDeletePost(String postId) async {
    await _supabase
        .from('community_posts')
        .update({'content_status': 'removed'})
        .eq('post_id', postId)
        .select()
        .single();
  }

  Future<List<Map<String, dynamic>>> searchPosts({
    required String keyword,
    required int page,
    List<String>? categories,
    DateTime? dateAfter,
    int? minLikes,
    int? minComments,
    CommunitySort sort = CommunitySort.newest,
  }) async {
    final startIndex = page * postsPageSize;
    final endIndex = startIndex + postsPageSize;

    var query = _supabase
        .from('community_posts_with_counts')
        .select(_postSelect)
        .eq('content_status', 'published')
        .or('title.ilike.%$keyword%,content.ilike.%$keyword%');

    if (categories != null && categories.isNotEmpty) {
      query = query.inFilter('post_category', categories);
    }
    if (dateAfter != null) {
      query = query.gte('created_at', dateAfter.toIso8601String());
    }
    if (minLikes != null) {
      query = query.gte('likes_count', minLikes);
    }
    if (minComments != null) {
      query = query.gte('comments_count', minComments);
    }

    final dynamic data;
    switch (sort) {
      case CommunitySort.newest:
        data = await query
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
      case CommunitySort.oldest:
        data = await query
            .order('created_at', ascending: true)
            .range(startIndex, endIndex);
      case CommunitySort.mostLiked:
        data = await query
            .order('likes_count', ascending: false)
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
      case CommunitySort.mostCommented:
        data = await query
            .order('comments_count', ascending: false)
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
    }

    return List<Map<String, dynamic>>.from(data as List);
  }
}
