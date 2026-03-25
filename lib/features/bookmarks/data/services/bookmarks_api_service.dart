import 'package:supabase_flutter/supabase_flutter.dart';

class BookmarksApiService {
  final SupabaseClient _supabase;

  BookmarksApiService(this._supabase);

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

  Future<List<Map<String, dynamic>>> fetchBookmarkedListings(int page) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return [];

    final start = page * listingsPageSize;
    final end = start + listingsPageSize;

    final data = await _supabase
        .from('bookmarked_listings')
        .select('listing_id, marketplace_listings!inner($_listingSelect)')
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .range(start, end);

    return (data as List)
        .map(
          (e) =>
              (e as Map<String, dynamic>)['marketplace_listings']
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

  Future<Set<String>> fetchBookmarkedListingIds(
    List<String> listingIds,
  ) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null || listingIds.isEmpty) return {};

    final data = await _supabase
        .from('bookmarked_listings')
        .select('listing_id')
        .eq('user_id', userId)
        .inFilter('listing_id', listingIds);

    return {
      for (final e in (data as List<dynamic>))
        (e as Map<String, dynamic>)['listing_id'] as String,
    };
  }

  Future<bool> togglePostBookmark(String postId) async {
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
      await _supabase
          .from('bookmarked_posts')
          .insert({'user_id': userId, 'post_id': postId});
      return true;
    }
  }

  Future<bool> toggleListingBookmark(String listingId) async {
    final userId = _supabase.auth.currentUser!.id;

    final existing = await _supabase
        .from('bookmarked_listings')
        .select('user_id')
        .eq('user_id', userId)
        .eq('listing_id', listingId)
        .maybeSingle();

    if (existing != null) {
      await _supabase
          .from('bookmarked_listings')
          .delete()
          .eq('user_id', userId)
          .eq('listing_id', listingId);
      return false;
    } else {
      await _supabase
          .from('bookmarked_listings')
          .insert({'user_id': userId, 'listing_id': listingId});
      return true;
    }
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
      await _supabase
          .from('community_posts_likes')
          .insert({'user_id': userId, 'post_id': postId});
      return true;
    }
  }
}
