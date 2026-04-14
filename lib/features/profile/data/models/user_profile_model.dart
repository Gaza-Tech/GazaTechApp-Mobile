// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
abstract class UserProfileModel with _$UserProfileModel {
  const UserProfileModel._();

  const factory UserProfileModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    String? bio,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'user_role') String? userRole,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'whatsapp_number') String? whatsappNumber,
    @JsonKey(name: 'facebook_link_url') String? facebookLinkUrl,
    @JsonKey(name: 'instagram_link_url') String? instagramLinkUrl,
    @JsonKey(name: 'twitter_link_url') String? twitterLinkUrl,
    @JsonKey(name: 'website_url') String? websiteUrl,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  String get fullName {
    if (!isActive) return 'Deleted Account';
    return '$firstName $lastName'.trim();
  }

  bool get hasSocialLinks =>
      facebookLinkUrl != null ||
      instagramLinkUrl != null ||
      twitterLinkUrl != null ||
      websiteUrl != null ||
      phoneNumber != null ||
      whatsappNumber != null;
}
