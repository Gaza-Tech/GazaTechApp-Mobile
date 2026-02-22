import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class AddListingApiService {
  final SupabaseClient _supabase;

  AddListingApiService(this._supabase);

  /// Fetch all active categories
  Future<List<Map<String, dynamic>>> fetchCategories() async {
    final data = await _supabase
        .from('marketplace_categories')
        .select()
        .eq('is_active', true)
        .order('name', ascending: true);

    return List<Map<String, dynamic>>.from(data);
  }

  /// Fetch all active locations
  Future<List<Map<String, dynamic>>> fetchLocations() async {
    final data = await _supabase
        .from('locations')
        .select()
        .eq('is_active', true)
        .order('sort_order', ascending: true);

    return List<Map<String, dynamic>>.from(data);
  }

  /// Insert a new listing into marketplace_listings
  Future<Map<String, dynamic>> createListing(
      Map<String, dynamic> data) async {
    final result = await _supabase
        .from('marketplace_listings')
        .insert(data)
        .select()
        .single();

    return result;
  }

  /// Upload a single image to Supabase Storage
  Future<String> uploadImage({
    required String sellerId,
    required String listingId,
    required File file,
    required int index,
  }) async {
    final extension = file.path.split('.').last;
    final path = '$sellerId/$listingId/$index.$extension';

    await _supabase.storage
        .from('listing-images')
        .upload(path, file);

    final publicUrl = _supabase.storage
        .from('listing-images')
        .getPublicUrl(path);

    return publicUrl;
  }

  /// Save image records to listing_images table
  Future<void> saveListingImages({
    required String listingId,
    required List<String> imageUrls,
  }) async {
    final records = imageUrls.asMap().entries.map((entry) => {
          'listing_id': listingId,
          'image_url': entry.value,
          'sort_order': entry.key + 1,
          'is_thumbnail': entry.key == 0,
        }).toList();

    await _supabase.from('listing_images').insert(records);
  }
}
