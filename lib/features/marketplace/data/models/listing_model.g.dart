// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListingModel _$ListingModelFromJson(Map<String, dynamic> json) =>
    _ListingModel(
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
    );

Map<String, dynamic> _$ListingModelToJson(_ListingModel instance) =>
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
    };
