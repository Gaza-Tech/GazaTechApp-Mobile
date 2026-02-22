// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListingDetailModel _$ListingDetailModelFromJson(Map<String, dynamic> json) =>
    _ListingDetailModel(
      listingId: json['listing_id'] as String,
      sellerId: json['seller_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      categoryId: json['category_id'] as String,
      productCondition: json['product_condition'] as String,
      price: (json['price'] as num).toInt(),
      currency: json['currency'] as String?,
      locationId: json['location_id'] as String,
      specifications: _specificationsFromJson(json['specifications']),
      contentStatus: json['content_status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      locationData: json['locations'] as Map<String, dynamic>?,
      sellerData: json['users'] as Map<String, dynamic>?,
      images: (json['listing_images'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      categoryData: json['marketplace_categories'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ListingDetailModelToJson(_ListingDetailModel instance) =>
    <String, dynamic>{
      'listing_id': instance.listingId,
      'seller_id': instance.sellerId,
      'title': instance.title,
      'description': instance.description,
      'category_id': instance.categoryId,
      'product_condition': instance.productCondition,
      'price': instance.price,
      'currency': instance.currency,
      'location_id': instance.locationId,
      'specifications': instance.specifications,
      'content_status': instance.contentStatus,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'locations': instance.locationData,
      'users': instance.sellerData,
      'listing_images': instance.images,
      'marketplace_categories': instance.categoryData,
    };
