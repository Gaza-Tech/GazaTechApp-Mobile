import 'package:supabase_flutter/supabase_flutter.dart';

class ListingDetailsApiService {
  final SupabaseClient _supabase;

  ListingDetailsApiService(this._supabase);

  /// Fetch a single listing by ID with all related data
  Future<Map<String, dynamic>> fetchListingById(String listingId) async {
    final data = await _supabase
        .from('marketplace_listings')
        .select(
          '*, locations!location_id(name, name_ar), '
          'users!seller_id(first_name, last_name, created_at, phone_number, whatsapp_number), '
          'listing_images(image_url, is_thumbnail, sort_order), '
          'marketplace_categories!category_id(name, name_ar, slug)',
        )
        .eq('listing_id', listingId)
        .single();

    return data;
  }

  /// Fetch similar listings (same category, excluding current)
  Future<List<Map<String, dynamic>>> fetchSimilarListings({
    required String categoryId,
    required String excludeListingId,
  }) async {
    final data = await _supabase
        .from('marketplace_listings')
        .select(
          '*, locations!location_id(name, name_ar), '
          'users!seller_id(first_name, last_name), '
          'listing_images(image_url, is_thumbnail, sort_order)',
        )
        .eq('content_status', 'published')
        .eq('category_id', categoryId)
        .neq('listing_id', excludeListingId)
        .order('created_at', ascending: false)
        .limit(6);

    return List<Map<String, dynamic>>.from(data);
  }

  /// Fetch other listings from the same seller (excluding current)
  Future<List<Map<String, dynamic>>> fetchSellerListings({
    required String sellerId,
    required String excludeListingId,
  }) async {
    final data = await _supabase
        .from('marketplace_listings')
        .select(
          '*, locations!location_id(name, name_ar), '
          'users!seller_id(first_name, last_name), '
          'listing_images(image_url, is_thumbnail, sort_order)',
        )
        .eq('content_status', 'published')
        .eq('seller_id', sellerId)
        .neq('listing_id', excludeListingId)
        .order('created_at', ascending: false)
        .limit(6);

    return List<Map<String, dynamic>>.from(data);
  }

  /// Check if the current user has bookmarked a listing
  Future<bool> isListingBookmarked(String listingId) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return false;

    final result = await _supabase
        .from('bookmarked_listings')
        .select('user_id')
        .eq('user_id', userId)
        .eq('listing_id', listingId)
        .maybeSingle();

    return result != null;
  }

  /// Check if the current user has reported a listing
  Future<bool> isListingReported(String listingId) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return false;

    final result = await _supabase
        .from('reports')
        .select('report_id')
        .eq('reporter_id', userId)
        .eq('reported_listing_id', listingId)
        .maybeSingle();

    return result != null;
  }

  /// Toggle bookmark for a listing; returns true if now bookmarked
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
      await _supabase.from('bookmarked_listings').insert({
        'user_id': userId,
        'listing_id': listingId,
      });
      return true;
    }
  }

  /// Increment view count for a listing
  Future<void> incrementViewCount(String listingId) async {
    await _supabase.rpc('increment_views', params: {'listing_id': listingId});
  }

  /// Soft delete a listing by setting content_status to 'deleted'
  Future<void> softDeleteListing(String listingId) async {
    await _supabase
        .from('marketplace_listings')
        .update({'content_status': 'removed'})
        .eq('listing_id', listingId)
        .select()
        .single();
  }
}
