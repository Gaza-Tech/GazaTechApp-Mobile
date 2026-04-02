// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_detail_model.freezed.dart';
part 'listing_detail_model.g.dart';

@freezed
abstract class ListingDetailModel with _$ListingDetailModel {
  const ListingDetailModel._();

  const factory ListingDetailModel({
    @JsonKey(name: 'listing_id') required String listingId,
    @JsonKey(name: 'seller_id') required String sellerId,
    required String title,
    required String description,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'product_condition') required String productCondition,
    required int price,
    String? currency,
    @JsonKey(name: 'location_id') required String locationId,
    @JsonKey(fromJson: _specificationsFromJson)
    Map<String, dynamic>? specifications,
    @JsonKey(name: 'content_status') required String contentStatus,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,

    // Joined data
    @JsonKey(name: 'locations') Map<String, dynamic>? locationData,
    @JsonKey(name: 'users') Map<String, dynamic>? sellerData,
    @JsonKey(name: 'listing_images') List<Map<String, dynamic>>? images,
    @JsonKey(name: 'marketplace_categories') Map<String, dynamic>? categoryData,
    @Default(false) @JsonKey(includeFromJson: false) bool isBookmarked,
    @Default(false) @JsonKey(includeFromJson: false) bool isReported,
  }) = _ListingDetailModel;

  factory ListingDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ListingDetailModelFromJson(json);

  String get locationName => locationData?['name'] ?? '';
  String get locationNameAr => locationData?['name_ar'] ?? '';

  String get sellerName {
    if (sellerData == null) return '';
    final first = sellerData!['first_name'] ?? '';
    final last = sellerData!['last_name'] ?? '';
    return '$first $last'.trim();
  }

  DateTime? get sellerJoinedAt {
    final raw = sellerData?['created_at'];
    if (raw is String) return DateTime.tryParse(raw);
    return null;
  }

  String? get sellerPhoneNumber => sellerData?['phone_number'] as String?;
  String? get sellerWhatsappNumber => sellerData?['whatsapp_number'] as String?;

  String get categoryName => categoryData?['name'] ?? '';
  String get categoryNameAr => categoryData?['name_ar'] ?? '';

  List<String> get imageUrls {
    if (images == null || images!.isEmpty) return [];
    final sorted = List<Map<String, dynamic>>.from(images!)
      ..sort(
        (a, b) => (a['sort_order'] as int? ?? 0).compareTo(
          b['sort_order'] as int? ?? 0,
        ),
      );
    return sorted.map((img) => img['image_url'] as String).toList();
  }

  List<MapEntry<String, String>> get specificationEntries {
    if (specifications == null) return [];
    // Specifications can be stored as a list of {label, value} or as a map
    final specs = specifications!;
    if (specs.containsKey('label') && specs.containsKey('value')) {
      return [MapEntry(specs['label'] as String, specs['value'] as String)];
    }
    return specs.entries
        .map((e) => MapEntry(e.key, e.value.toString()))
        .toList();
  }
}

Map<String, dynamic>? _specificationsFromJson(dynamic value) {
  if (value is Map<String, dynamic>) return value;
  if (value is List && value.isNotEmpty) {
    // Convert list of {label, value} to map
    final map = <String, dynamic>{};
    for (final item in value) {
      if (item is Map &&
          item.containsKey('label') &&
          item.containsKey('value')) {
        map[item['label'] as String] = item['value'];
      }
    }
    return map.isNotEmpty ? map : null;
  }
  return null;
}
