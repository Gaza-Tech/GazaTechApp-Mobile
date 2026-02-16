// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_model.freezed.dart';
part 'listing_model.g.dart';

@freezed
abstract class ListingModel with _$ListingModel {
  const ListingModel._();

  const factory ListingModel({
    @JsonKey(name: 'listing_id') required String listingId,
    @JsonKey(name: 'seller_id') required String sellerId,
    required String title,
    required String description,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'product_condition') required String productCondition,
    required int price,
    String? currency,
    @JsonKey(name: 'location_id') required String locationId,
    @JsonKey(fromJson: _specificationsFromJson) Map<String, dynamic>? specifications,
    @JsonKey(name: 'content_status') required String contentStatus,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,

    // Joined data from Supabase nested select
    @JsonKey(name: 'locations') Map<String, dynamic>? locationData,
    @JsonKey(name: 'users') Map<String, dynamic>? sellerData,
  }) = _ListingModel;

  factory ListingModel.fromJson(Map<String, dynamic> json) =>
      _$ListingModelFromJson(json);

  String get locationName => locationData?['name'] ?? '';
  String get locationNameAr => locationData?['name_ar'] ?? '';
  String get sellerName {
    if (sellerData == null) return '';
    final first = sellerData!['first_name'] ?? '';
    final last = sellerData!['last_name'] ?? '';
    return '$first $last'.trim();
  }
}

Map<String, dynamic>? _specificationsFromJson(dynamic value) {
  if (value is Map<String, dynamic>) return value;
  return null;
}
