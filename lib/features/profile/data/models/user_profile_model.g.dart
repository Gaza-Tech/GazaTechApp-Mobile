// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      userId: json['user_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      bio: json['bio'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      userRole: json['user_role'] as String?,
      phoneNumber: json['phone_number'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      facebookLinkUrl: json['facebook_link_url'] as String?,
      instagramLinkUrl: json['instagram_link_url'] as String?,
      twitterLinkUrl: json['twitter_link_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'bio': instance.bio,
      'avatar_url': instance.avatarUrl,
      'user_role': instance.userRole,
      'phone_number': instance.phoneNumber,
      'whatsapp_number': instance.whatsappNumber,
      'facebook_link_url': instance.facebookLinkUrl,
      'instagram_link_url': instance.instagramLinkUrl,
      'twitter_link_url': instance.twitterLinkUrl,
      'website_url': instance.websiteUrl,
      'is_verified': instance.isVerified,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
    };
