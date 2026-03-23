import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileApiService {
  final SupabaseClient _supabase;

  ProfileApiService(this._supabase);

  static const int postsPageSize = 10;
  static const int listingsPageSize = 20;

  static const String _postSelect = '''
    post_id, author_id, title, content, post_category, content_status,
    created_at, published_at, likes_count, comments_count,
    users!author_id(user_id, first_name, last_name, avatar_url),
    community_posts_attachments(file_url)
  ''';

  static const String _listingSelect =
      '*, locations!location_id(name, name_ar), users!seller_id(first_name, last_name), listing_images(image_url, is_thumbnail, sort_order)';

  Future<Map<String, dynamic>?> fetchUserProfile(String userId) async {
    return await _supabase
        .from('users')
        .select()
        .eq('user_id', userId)
        .maybeSingle();
  }

  Future<List<Map<String, dynamic>>> fetchUserPosts(
    String userId,
    int page,
  ) async {
    final start = page * postsPageSize;
    final end = start + postsPageSize;

    final data = await _supabase
        .from('community_posts_with_counts')
        .select(_postSelect)
        .eq('author_id', userId)
        .eq('content_status', 'published')
        .order('created_at', ascending: false)
        .range(start, end);

    return List<Map<String, dynamic>>.from(data as List);
  }

  Future<List<Map<String, dynamic>>> fetchUserListings(
    String userId,
    int page,
  ) async {
    final start = page * listingsPageSize;
    final end = start + listingsPageSize;

    final data = await _supabase
        .from('marketplace_listings')
        .select(_listingSelect)
        .eq('seller_id', userId)
        .eq('content_status', 'published')
        .order('created_at', ascending: false)
        .range(start, end);

    return List<Map<String, dynamic>>.from(data as List);
  }

  Future<List<Map<String, dynamic>>> fetchBookmarkedPosts(int page) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    final start = page * postsPageSize;
    final end = start + postsPageSize;

    final data = await _supabase
        .from('bookmarked_posts')
        .select('post_id, community_posts_with_counts!inner($_postSelect)')
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .range(start, end);

    return (data as List)
        .map(
          (e) =>
              (e as Map<String, dynamic>)['community_posts_with_counts']
                  as Map<String, dynamic>,
        )
        .toList();
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
}
