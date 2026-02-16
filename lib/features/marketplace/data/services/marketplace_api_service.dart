import 'package:supabase_flutter/supabase_flutter.dart';

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
  }) async {
    final startIndex = page * pageSize;
    // Fetch pageSize + 1 to check if there are more items
    final endIndex = startIndex + pageSize;

    // Build query
    var query = _supabase
        .from('marketplace_listings')
        .select()
        .eq('content_status', 'published');

    // Apply category filter using UUID (skip if null = "all")
    if (categoryId != null) {
      query = query.eq('category_id', categoryId);
    }

    // Order by created_at descending (newest first) and apply pagination
    final data = await query
        .order('created_at', ascending: false)
        .range(startIndex, endIndex);

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
        .select()
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


