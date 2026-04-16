// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_author_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostAuthorModel {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'is_verified') bool get isVerified;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of PostAuthorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostAuthorModelCopyWith<PostAuthorModel> get copyWith => _$PostAuthorModelCopyWithImpl<PostAuthorModel>(this as PostAuthorModel, _$identity);

  /// Serializes this PostAuthorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostAuthorModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,firstName,lastName,avatarUrl,isVerified,isActive);

@override
String toString() {
  return 'PostAuthorModel(userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, isVerified: $isVerified, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PostAuthorModelCopyWith<$Res>  {
  factory $PostAuthorModelCopyWith(PostAuthorModel value, $Res Function(PostAuthorModel) _then) = _$PostAuthorModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$PostAuthorModelCopyWithImpl<$Res>
    implements $PostAuthorModelCopyWith<$Res> {
  _$PostAuthorModelCopyWithImpl(this._self, this._then);

  final PostAuthorModel _self;
  final $Res Function(PostAuthorModel) _then;

/// Create a copy of PostAuthorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? firstName = null,Object? lastName = null,Object? avatarUrl = freezed,Object? isVerified = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostAuthorModel].
extension PostAuthorModelPatterns on PostAuthorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostAuthorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostAuthorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostAuthorModel value)  $default,){
final _that = this;
switch (_that) {
case _PostAuthorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostAuthorModel value)?  $default,){
final _that = this;
switch (_that) {
case _PostAuthorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostAuthorModel() when $default != null:
return $default(_that.userId,_that.firstName,_that.lastName,_that.avatarUrl,_that.isVerified,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _PostAuthorModel():
return $default(_that.userId,_that.firstName,_that.lastName,_that.avatarUrl,_that.isVerified,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _PostAuthorModel() when $default != null:
return $default(_that.userId,_that.firstName,_that.lastName,_that.avatarUrl,_that.isVerified,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostAuthorModel implements PostAuthorModel {
  const _PostAuthorModel({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'is_verified') this.isVerified = false, @JsonKey(name: 'is_active') this.isActive = true});
  factory _PostAuthorModel.fromJson(Map<String, dynamic> json) => _$PostAuthorModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'is_verified') final  bool isVerified;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of PostAuthorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostAuthorModelCopyWith<_PostAuthorModel> get copyWith => __$PostAuthorModelCopyWithImpl<_PostAuthorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostAuthorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostAuthorModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,firstName,lastName,avatarUrl,isVerified,isActive);

@override
String toString() {
  return 'PostAuthorModel(userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, isVerified: $isVerified, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PostAuthorModelCopyWith<$Res> implements $PostAuthorModelCopyWith<$Res> {
  factory _$PostAuthorModelCopyWith(_PostAuthorModel value, $Res Function(_PostAuthorModel) _then) = __$PostAuthorModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$PostAuthorModelCopyWithImpl<$Res>
    implements _$PostAuthorModelCopyWith<$Res> {
  __$PostAuthorModelCopyWithImpl(this._self, this._then);

  final _PostAuthorModel _self;
  final $Res Function(_PostAuthorModel) _then;

/// Create a copy of PostAuthorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? firstName = null,Object? lastName = null,Object? avatarUrl = freezed,Object? isVerified = null,Object? isActive = null,}) {
  return _then(_PostAuthorModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
