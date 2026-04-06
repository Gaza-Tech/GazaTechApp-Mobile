// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiChatListingModel _$AiChatListingModelFromJson(Map<String, dynamic> json) =>
    _AiChatListingModel(
      listingId: json['listing_id'] as String,
      title: json['title'] as String,
      price: json['price'] as num,
      currency: json['currency'] as String? ?? 'ILS',
      productCondition: json['product_condition'] as String? ?? '',
      image: json['image'] as String?,
      location: json['location'] as String?,
      sellerName: json['sellerName'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$AiChatListingModelToJson(_AiChatListingModel instance) =>
    <String, dynamic>{
      'listing_id': instance.listingId,
      'title': instance.title,
      'price': instance.price,
      'currency': instance.currency,
      'product_condition': instance.productCondition,
      'image': instance.image,
      'location': instance.location,
      'sellerName': instance.sellerName,
      'isVerified': instance.isVerified,
      'category': instance.category,
    };
