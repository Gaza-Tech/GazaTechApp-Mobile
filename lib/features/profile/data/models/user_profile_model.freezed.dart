// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileModel {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String? get bio;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'user_role') String? get userRole;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'whatsapp_number') String? get whatsappNumber;@JsonKey(name: 'facebook_link_url') String? get facebookLinkUrl;@JsonKey(name: 'instagram_link_url') String? get instagramLinkUrl;@JsonKey(name: 'twitter_link_url') String? get twitterLinkUrl;@JsonKey(name: 'website_url') String? get websiteUrl;@JsonKey(name: 'is_verified') bool get isVerified;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<UserProfileModel> get copyWith => _$UserProfileModelCopyWithImpl<UserProfileModel>(this as UserProfileModel, _$identity);

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.userRole, userRole) || other.userRole == userRole)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.facebookLinkUrl, facebookLinkUrl) || other.facebookLinkUrl == facebookLinkUrl)&&(identical(other.instagramLinkUrl, instagramLinkUrl) || other.instagramLinkUrl == instagramLinkUrl)&&(identical(other.twitterLinkUrl, twitterLinkUrl) || other.twitterLinkUrl == twitterLinkUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,firstName,lastName,bio,avatarUrl,userRole,phoneNumber,whatsappNumber,facebookLinkUrl,instagramLinkUrl,twitterLinkUrl,websiteUrl,isVerified,isActive,createdAt);

@override
String toString() {
  return 'UserProfileModel(userId: $userId, firstName: $firstName, lastName: $lastName, bio: $bio, avatarUrl: $avatarUrl, userRole: $userRole, phoneNumber: $phoneNumber, whatsappNumber: $whatsappNumber, facebookLinkUrl: $facebookLinkUrl, instagramLinkUrl: $instagramLinkUrl, twitterLinkUrl: $twitterLinkUrl, websiteUrl: $websiteUrl, isVerified: $isVerified, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserProfileModelCopyWith<$Res>  {
  factory $UserProfileModelCopyWith(UserProfileModel value, $Res Function(UserProfileModel) _then) = _$UserProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String? bio,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'user_role') String? userRole,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'whatsapp_number') String? whatsappNumber,@JsonKey(name: 'facebook_link_url') String? facebookLinkUrl,@JsonKey(name: 'instagram_link_url') String? instagramLinkUrl,@JsonKey(name: 'twitter_link_url') String? twitterLinkUrl,@JsonKey(name: 'website_url') String? websiteUrl,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._self, this._then);

  final UserProfileModel _self;
  final $Res Function(UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? firstName = null,Object? lastName = null,Object? bio = freezed,Object? avatarUrl = freezed,Object? userRole = freezed,Object? phoneNumber = freezed,Object? whatsappNumber = freezed,Object? facebookLinkUrl = freezed,Object? instagramLinkUrl = freezed,Object? twitterLinkUrl = freezed,Object? websiteUrl = freezed,Object? isVerified = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,userRole: freezed == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,facebookLinkUrl: freezed == facebookLinkUrl ? _self.facebookLinkUrl : facebookLinkUrl // ignore: cast_nullable_to_non_nullable
as String?,instagramLinkUrl: freezed == instagramLinkUrl ? _self.instagramLinkUrl : instagramLinkUrl // ignore: cast_nullable_to_non_nullable
as String?,twitterLinkUrl: freezed == twitterLinkUrl ? _self.twitterLinkUrl : twitterLinkUrl // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileModel].
extension UserProfileModelPatterns on UserProfileModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'user_role')  String? userRole, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber, @JsonKey(name: 'facebook_link_url')  String? facebookLinkUrl, @JsonKey(name: 'instagram_link_url')  String? instagramLinkUrl, @JsonKey(name: 'twitter_link_url')  String? twitterLinkUrl, @JsonKey(name: 'website_url')  String? websiteUrl, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.userId,_that.firstName,_that.lastName,_that.bio,_that.avatarUrl,_that.userRole,_that.phoneNumber,_that.whatsappNumber,_that.facebookLinkUrl,_that.instagramLinkUrl,_that.twitterLinkUrl,_that.websiteUrl,_that.isVerified,_that.isActive,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'user_role')  String? userRole, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber, @JsonKey(name: 'facebook_link_url')  String? facebookLinkUrl, @JsonKey(name: 'instagram_link_url')  String? instagramLinkUrl, @JsonKey(name: 'twitter_link_url')  String? twitterLinkUrl, @JsonKey(name: 'website_url')  String? websiteUrl, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel():
return $default(_that.userId,_that.firstName,_that.lastName,_that.bio,_that.avatarUrl,_that.userRole,_that.phoneNumber,_that.whatsappNumber,_that.facebookLinkUrl,_that.instagramLinkUrl,_that.twitterLinkUrl,_that.websiteUrl,_that.isVerified,_that.isActive,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String? bio, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'user_role')  String? userRole, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'whatsapp_number')  String? whatsappNumber, @JsonKey(name: 'facebook_link_url')  String? facebookLinkUrl, @JsonKey(name: 'instagram_link_url')  String? instagramLinkUrl, @JsonKey(name: 'twitter_link_url')  String? twitterLinkUrl, @JsonKey(name: 'website_url')  String? websiteUrl, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.userId,_that.firstName,_that.lastName,_that.bio,_that.avatarUrl,_that.userRole,_that.phoneNumber,_that.whatsappNumber,_that.facebookLinkUrl,_that.instagramLinkUrl,_that.twitterLinkUrl,_that.websiteUrl,_that.isVerified,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileModel extends UserProfileModel {
  const _UserProfileModel({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, this.bio, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'user_role') this.userRole, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'whatsapp_number') this.whatsappNumber, @JsonKey(name: 'facebook_link_url') this.facebookLinkUrl, @JsonKey(name: 'instagram_link_url') this.instagramLinkUrl, @JsonKey(name: 'twitter_link_url') this.twitterLinkUrl, @JsonKey(name: 'website_url') this.websiteUrl, @JsonKey(name: 'is_verified') this.isVerified = false, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'created_at') required this.createdAt}): super._();
  factory _UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String? bio;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'user_role') final  String? userRole;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'whatsapp_number') final  String? whatsappNumber;
@override@JsonKey(name: 'facebook_link_url') final  String? facebookLinkUrl;
@override@JsonKey(name: 'instagram_link_url') final  String? instagramLinkUrl;
@override@JsonKey(name: 'twitter_link_url') final  String? twitterLinkUrl;
@override@JsonKey(name: 'website_url') final  String? websiteUrl;
@override@JsonKey(name: 'is_verified') final  bool isVerified;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileModelCopyWith<_UserProfileModel> get copyWith => __$UserProfileModelCopyWithImpl<_UserProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.userRole, userRole) || other.userRole == userRole)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.whatsappNumber, whatsappNumber) || other.whatsappNumber == whatsappNumber)&&(identical(other.facebookLinkUrl, facebookLinkUrl) || other.facebookLinkUrl == facebookLinkUrl)&&(identical(other.instagramLinkUrl, instagramLinkUrl) || other.instagramLinkUrl == instagramLinkUrl)&&(identical(other.twitterLinkUrl, twitterLinkUrl) || other.twitterLinkUrl == twitterLinkUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,firstName,lastName,bio,avatarUrl,userRole,phoneNumber,whatsappNumber,facebookLinkUrl,instagramLinkUrl,twitterLinkUrl,websiteUrl,isVerified,isActive,createdAt);

@override
String toString() {
  return 'UserProfileModel(userId: $userId, firstName: $firstName, lastName: $lastName, bio: $bio, avatarUrl: $avatarUrl, userRole: $userRole, phoneNumber: $phoneNumber, whatsappNumber: $whatsappNumber, facebookLinkUrl: $facebookLinkUrl, instagramLinkUrl: $instagramLinkUrl, twitterLinkUrl: $twitterLinkUrl, websiteUrl: $websiteUrl, isVerified: $isVerified, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileModelCopyWith<$Res> implements $UserProfileModelCopyWith<$Res> {
  factory _$UserProfileModelCopyWith(_UserProfileModel value, $Res Function(_UserProfileModel) _then) = __$UserProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String? bio,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'user_role') String? userRole,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'whatsapp_number') String? whatsappNumber,@JsonKey(name: 'facebook_link_url') String? facebookLinkUrl,@JsonKey(name: 'instagram_link_url') String? instagramLinkUrl,@JsonKey(name: 'twitter_link_url') String? twitterLinkUrl,@JsonKey(name: 'website_url') String? websiteUrl,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$UserProfileModelCopyWithImpl<$Res>
    implements _$UserProfileModelCopyWith<$Res> {
  __$UserProfileModelCopyWithImpl(this._self, this._then);

  final _UserProfileModel _self;
  final $Res Function(_UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? firstName = null,Object? lastName = null,Object? bio = freezed,Object? avatarUrl = freezed,Object? userRole = freezed,Object? phoneNumber = freezed,Object? whatsappNumber = freezed,Object? facebookLinkUrl = freezed,Object? instagramLinkUrl = freezed,Object? twitterLinkUrl = freezed,Object? websiteUrl = freezed,Object? isVerified = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_UserProfileModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,userRole: freezed == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,whatsappNumber: freezed == whatsappNumber ? _self.whatsappNumber : whatsappNumber // ignore: cast_nullable_to_non_nullable
as String?,facebookLinkUrl: freezed == facebookLinkUrl ? _self.facebookLinkUrl : facebookLinkUrl // ignore: cast_nullable_to_non_nullable
as String?,instagramLinkUrl: freezed == instagramLinkUrl ? _self.instagramLinkUrl : instagramLinkUrl // ignore: cast_nullable_to_non_nullable
as String?,twitterLinkUrl: freezed == twitterLinkUrl ? _self.twitterLinkUrl : twitterLinkUrl // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
