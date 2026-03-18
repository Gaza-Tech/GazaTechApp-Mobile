import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/marketplace_sort.dart';

class MarketplaceApiService {
  final SupabaseClient _supabase;

  MarketplaceApiService(this._supabase);

  // Constants for pagination
  static const int pageSize = 20;

  /// Fetch listings by category with pagination
  /// [categoryId] is the UUID from marketplace_categories table, or null for 'all'
  Future<List<Map<String, dynamic>>> fetchListingsByCategory({
    required String? categoryId,
    required int page,
    MarketplaceSort sort = MarketplaceSort.newest,
  }) async {
    final startIndex = page * pageSize;
    // Fetch pageSize + 1 to check if there are more items
    final endIndex = startIndex + pageSize;

    // Build query with joined location & seller data
    var query = _supabase
        .from('marketplace_listings')
        .select('*, locations!location_id(name, name_ar), users!seller_id(first_name, last_name), listing_images(image_url, is_thumbnail, sort_order)')
        .eq('content_status', 'published');

    // Apply category filter using UUID (skip if null = "all")
    if (categoryId != null) {
      query = query.eq('category_id', categoryId);
    }

    // Apply sort order and pagination
    final List<dynamic> data;
    switch (sort) {
      case MarketplaceSort.newest:
        data = await query
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
      case MarketplaceSort.oldest:
        data = await query
            .order('created_at', ascending: true)
            .range(startIndex, endIndex);
      case MarketplaceSort.priceLowToHigh:
        data = await query
            .order('price', ascending: true)
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
      case MarketplaceSort.priceHighToLow:
        data = await query
            .order('price', ascending: false)
            .order('created_at', ascending: false)
            .range(startIndex, endIndex);
    }

    return List<Map<String, dynamic>>.from(data);
  }

  /// Fetch all categories
  Future<List<Map<String, dynamic>>> fetchCategories() async {
    final data = await _supabase
        .from('marketplace_categories')
        .select()
        .eq('is_active', true)
        .order('name', ascending: true);

    return List<Map<String, dynamic>>.from(data);
  }

  /// Search listings by keyword
  /// Returns one extra item to determine if there are more pages
  Future<List<Map<String, dynamic>>> searchListings({
    required String keyword,
    required int page,
  }) async {
    final startIndex = page * pageSize;
    // Fetch pageSize + 1 to check if there are more items
    final endIndex = startIndex + pageSize;

    final data = await _supabase
        .from('marketplace_listings')
        .select('*, locations!location_id(name, name_ar), users!seller_id(first_name, last_name), listing_images(image_url, is_thumbnail, sort_order)')
        .eq('content_status', 'published')
        .or('title.ilike.%$keyword%,description.ilike.%$keyword%')
        .order('created_at', ascending: false)
        .range(startIndex, endIndex);

    return List<Map<String, dynamic>>.from(data);
  }

  /// Increment view count for a listing
  Future<void> incrementViewCount(String listingId) async {
    await _supabase.rpc('increment_views', params: {'listing_id': listingId});
  }
}


