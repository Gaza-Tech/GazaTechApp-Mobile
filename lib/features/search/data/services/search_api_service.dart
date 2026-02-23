import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/search_filters_model.dart';

class SearchApiService {
  final SupabaseClient _supabase;

  SearchApiService(this._supabase);

  static const int pageSize = 20;

  /// Fetch all active categories for filter dropdown
  Future<List<Map<String, dynamic>>> fetchCategories() async {
    final data = await _supabase
        .from('marketplace_categories')
        .select()
        .eq('is_active', true)
        .order('name', ascending: true);

    return List<Map<String, dynamic>>.from(data);
  }

  /// Fetch all active locations for filter dropdown
  Future<List<Map<String, dynamic>>> fetchLocations() async {
    final data = await _supabase
        .from('locations')
        .select()
        .eq('is_active', true)
        .order('sort_order', ascending: true);

    return List<Map<String, dynamic>>.from(data);
  }

  /// Advanced search with dynamic filters, sort, and pagination
  Future<List<Map<String, dynamic>>> searchListings({
    String? keyword,
    String? categoryId,
    String? locationId,
    List<String>? conditions,
    int? priceMinUsd,
    int? priceMaxUsd,
    int? priceMinIls,
    int? priceMaxIls,
    SearchSortOption sort = SearchSortOption.newest,
    required int page,
  }) async {
    final startIndex = page * pageSize;
    final endIndex = startIndex + pageSize;

    var query = _supabase
        .from('marketplace_listings')
        .select(
          '*, locations!location_id(name, name_ar), '
          'users!seller_id(first_name, last_name), '
          'listing_images(image_url, is_thumbnail, sort_order)',
        )
        .eq('content_status', 'published');

    if (keyword != null && keyword.trim().isNotEmpty) {
      final k = keyword.trim();
      query = query.or('title.ilike.%$k%,description.ilike.%$k%');
    }

    if (categoryId != null) {
      query = query.eq('category_id', categoryId);
    }

    if (locationId != null) {
      query = query.eq('location_id', locationId);
    }

    if (conditions != null && conditions.isNotEmpty) {
      query = query.inFilter('product_condition', conditions);
    }

    // Build currency-specific price filters
    final hasUsdFilter = priceMinUsd != null || priceMaxUsd != null;
    final hasIlsFilter = priceMinIls != null || priceMaxIls != null;

    if (hasUsdFilter && hasIlsFilter) {
      // Both currencies: use OR to match either
      final usdParts = <String>[];
      final ilsParts = <String>[];

      usdParts.add('currency.eq.USD');
      if (priceMinUsd != null) usdParts.add('price.gte.$priceMinUsd');
      if (priceMaxUsd != null) usdParts.add('price.lte.$priceMaxUsd');

      ilsParts.add('currency.eq.ILS');
      if (priceMinIls != null) ilsParts.add('price.gte.$priceMinIls');
      if (priceMaxIls != null) ilsParts.add('price.lte.$priceMaxIls');

      query = query.or(
        'and(${usdParts.join(",")}),and(${ilsParts.join(",")})',
      );
    } else if (hasUsdFilter) {
      query = query.eq('currency', 'USD');
      if (priceMinUsd != null) query = query.gte('price', priceMinUsd);
      if (priceMaxUsd != null) query = query.lte('price', priceMaxUsd);
    } else if (hasIlsFilter) {
      query = query.eq('currency', 'ILS');
      if (priceMinIls != null) query = query.gte('price', priceMinIls);
      if (priceMaxIls != null) query = query.lte('price', priceMaxIls);
    }

    String sortField;
    bool ascending;
    switch (sort) {
      case SearchSortOption.newest:
        sortField = 'created_at';
        ascending = false;
      case SearchSortOption.priceLowToHigh:
        sortField = 'price';
        ascending = true;
      case SearchSortOption.priceHighToLow:
        sortField = 'price';
        ascending = false;
    }

    final data = await query
        .order(sortField, ascending: ascending)
        .range(startIndex, endIndex);

    return List<Map<String, dynamic>>.from(data);
  }
}
