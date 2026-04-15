// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationModel {

@JsonKey(name: 'group_key') String get groupKey;@JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson) NotificationType get type;@JsonKey(name: 'target_type') String? get targetType;@JsonKey(name: 'target_id') String? get targetId;@JsonKey(name: 'latest_id') String get latestId;@JsonKey(name: 'latest_actor_id') String? get latestActorId;@JsonKey(name: 'latest_actor_first_name') String? get latestActorFirstName;@JsonKey(name: 'latest_actor_last_name') String? get latestActorLastName;@JsonKey(name: 'latest_actor_avatar_url') String? get latestActorAvatarUrl;@JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson) int get actorsCount;@JsonKey(name: 'is_read') bool get isRead;@JsonKey(name: 'latest_created_at') DateTime get latestCreatedAt; Map<String, dynamic> get metadata;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.groupKey, groupKey) || other.groupKey == groupKey)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.latestId, latestId) || other.latestId == latestId)&&(identical(other.latestActorId, latestActorId) || other.latestActorId == latestActorId)&&(identical(other.latestActorFirstName, latestActorFirstName) || other.latestActorFirstName == latestActorFirstName)&&(identical(other.latestActorLastName, latestActorLastName) || other.latestActorLastName == latestActorLastName)&&(identical(other.latestActorAvatarUrl, latestActorAvatarUrl) || other.latestActorAvatarUrl == latestActorAvatarUrl)&&(identical(other.actorsCount, actorsCount) || other.actorsCount == actorsCount)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.latestCreatedAt, latestCreatedAt) || other.latestCreatedAt == latestCreatedAt)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupKey,type,targetType,targetId,latestId,latestActorId,latestActorFirstName,latestActorLastName,latestActorAvatarUrl,actorsCount,isRead,latestCreatedAt,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'NotificationModel(groupKey: $groupKey, type: $type, targetType: $targetType, targetId: $targetId, latestId: $latestId, latestActorId: $latestActorId, latestActorFirstName: $latestActorFirstName, latestActorLastName: $latestActorLastName, latestActorAvatarUrl: $latestActorAvatarUrl, actorsCount: $actorsCount, isRead: $isRead, latestCreatedAt: $latestCreatedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_key') String groupKey,@JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson) NotificationType type,@JsonKey(name: 'target_type') String? targetType,@JsonKey(name: 'target_id') String? targetId,@JsonKey(name: 'latest_id') String latestId,@JsonKey(name: 'latest_actor_id') String? latestActorId,@JsonKey(name: 'latest_actor_first_name') String? latestActorFirstName,@JsonKey(name: 'latest_actor_last_name') String? latestActorLastName,@JsonKey(name: 'latest_actor_avatar_url') String? latestActorAvatarUrl,@JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson) int actorsCount,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'latest_created_at') DateTime latestCreatedAt, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupKey = null,Object? type = null,Object? targetType = freezed,Object? targetId = freezed,Object? latestId = null,Object? latestActorId = freezed,Object? latestActorFirstName = freezed,Object? latestActorLastName = freezed,Object? latestActorAvatarUrl = freezed,Object? actorsCount = null,Object? isRead = null,Object? latestCreatedAt = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
groupKey: null == groupKey ? _self.groupKey : groupKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,targetType: freezed == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String?,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,latestId: null == latestId ? _self.latestId : latestId // ignore: cast_nullable_to_non_nullable
as String,latestActorId: freezed == latestActorId ? _self.latestActorId : latestActorId // ignore: cast_nullable_to_non_nullable
as String?,latestActorFirstName: freezed == latestActorFirstName ? _self.latestActorFirstName : latestActorFirstName // ignore: cast_nullable_to_non_nullable
as String?,latestActorLastName: freezed == latestActorLastName ? _self.latestActorLastName : latestActorLastName // ignore: cast_nullable_to_non_nullable
as String?,latestActorAvatarUrl: freezed == latestActorAvatarUrl ? _self.latestActorAvatarUrl : latestActorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,actorsCount: null == actorsCount ? _self.actorsCount : actorsCount // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,latestCreatedAt: null == latestCreatedAt ? _self.latestCreatedAt : latestCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationModel].
extension NotificationModelPatterns on NotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_key')  String groupKey, @JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson)  NotificationType type, @JsonKey(name: 'target_type')  String? targetType, @JsonKey(name: 'target_id')  String? targetId, @JsonKey(name: 'latest_id')  String latestId, @JsonKey(name: 'latest_actor_id')  String? latestActorId, @JsonKey(name: 'latest_actor_first_name')  String? latestActorFirstName, @JsonKey(name: 'latest_actor_last_name')  String? latestActorLastName, @JsonKey(name: 'latest_actor_avatar_url')  String? latestActorAvatarUrl, @JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson)  int actorsCount, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'latest_created_at')  DateTime latestCreatedAt,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.groupKey,_that.type,_that.targetType,_that.targetId,_that.latestId,_that.latestActorId,_that.latestActorFirstName,_that.latestActorLastName,_that.latestActorAvatarUrl,_that.actorsCount,_that.isRead,_that.latestCreatedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_key')  String groupKey, @JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson)  NotificationType type, @JsonKey(name: 'target_type')  String? targetType, @JsonKey(name: 'target_id')  String? targetId, @JsonKey(name: 'latest_id')  String latestId, @JsonKey(name: 'latest_actor_id')  String? latestActorId, @JsonKey(name: 'latest_actor_first_name')  String? latestActorFirstName, @JsonKey(name: 'latest_actor_last_name')  String? latestActorLastName, @JsonKey(name: 'latest_actor_avatar_url')  String? latestActorAvatarUrl, @JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson)  int actorsCount, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'latest_created_at')  DateTime latestCreatedAt,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _NotificationModel():
return $default(_that.groupKey,_that.type,_that.targetType,_that.targetId,_that.latestId,_that.latestActorId,_that.latestActorFirstName,_that.latestActorLastName,_that.latestActorAvatarUrl,_that.actorsCount,_that.isRead,_that.latestCreatedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'group_key')  String groupKey, @JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson)  NotificationType type, @JsonKey(name: 'target_type')  String? targetType, @JsonKey(name: 'target_id')  String? targetId, @JsonKey(name: 'latest_id')  String latestId, @JsonKey(name: 'latest_actor_id')  String? latestActorId, @JsonKey(name: 'latest_actor_first_name')  String? latestActorFirstName, @JsonKey(name: 'latest_actor_last_name')  String? latestActorLastName, @JsonKey(name: 'latest_actor_avatar_url')  String? latestActorAvatarUrl, @JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson)  int actorsCount, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'latest_created_at')  DateTime latestCreatedAt,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.groupKey,_that.type,_that.targetType,_that.targetId,_that.latestId,_that.latestActorId,_that.latestActorFirstName,_that.latestActorLastName,_that.latestActorAvatarUrl,_that.actorsCount,_that.isRead,_that.latestCreatedAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationModel extends NotificationModel {
  const _NotificationModel({@JsonKey(name: 'group_key') required this.groupKey, @JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson) required this.type, @JsonKey(name: 'target_type') this.targetType, @JsonKey(name: 'target_id') this.targetId, @JsonKey(name: 'latest_id') required this.latestId, @JsonKey(name: 'latest_actor_id') this.latestActorId, @JsonKey(name: 'latest_actor_first_name') this.latestActorFirstName, @JsonKey(name: 'latest_actor_last_name') this.latestActorLastName, @JsonKey(name: 'latest_actor_avatar_url') this.latestActorAvatarUrl, @JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson) this.actorsCount = 1, @JsonKey(name: 'is_read') this.isRead = false, @JsonKey(name: 'latest_created_at') required this.latestCreatedAt, final  Map<String, dynamic> metadata = const {}}): _metadata = metadata,super._();
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override@JsonKey(name: 'group_key') final  String groupKey;
@override@JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson) final  NotificationType type;
@override@JsonKey(name: 'target_type') final  String? targetType;
@override@JsonKey(name: 'target_id') final  String? targetId;
@override@JsonKey(name: 'latest_id') final  String latestId;
@override@JsonKey(name: 'latest_actor_id') final  String? latestActorId;
@override@JsonKey(name: 'latest_actor_first_name') final  String? latestActorFirstName;
@override@JsonKey(name: 'latest_actor_last_name') final  String? latestActorLastName;
@override@JsonKey(name: 'latest_actor_avatar_url') final  String? latestActorAvatarUrl;
@override@JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson) final  int actorsCount;
@override@JsonKey(name: 'is_read') final  bool isRead;
@override@JsonKey(name: 'latest_created_at') final  DateTime latestCreatedAt;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.groupKey, groupKey) || other.groupKey == groupKey)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.latestId, latestId) || other.latestId == latestId)&&(identical(other.latestActorId, latestActorId) || other.latestActorId == latestActorId)&&(identical(other.latestActorFirstName, latestActorFirstName) || other.latestActorFirstName == latestActorFirstName)&&(identical(other.latestActorLastName, latestActorLastName) || other.latestActorLastName == latestActorLastName)&&(identical(other.latestActorAvatarUrl, latestActorAvatarUrl) || other.latestActorAvatarUrl == latestActorAvatarUrl)&&(identical(other.actorsCount, actorsCount) || other.actorsCount == actorsCount)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.latestCreatedAt, latestCreatedAt) || other.latestCreatedAt == latestCreatedAt)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupKey,type,targetType,targetId,latestId,latestActorId,latestActorFirstName,latestActorLastName,latestActorAvatarUrl,actorsCount,isRead,latestCreatedAt,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'NotificationModel(groupKey: $groupKey, type: $type, targetType: $targetType, targetId: $targetId, latestId: $latestId, latestActorId: $latestActorId, latestActorFirstName: $latestActorFirstName, latestActorLastName: $latestActorLastName, latestActorAvatarUrl: $latestActorAvatarUrl, actorsCount: $actorsCount, isRead: $isRead, latestCreatedAt: $latestCreatedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_key') String groupKey,@JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson) NotificationType type,@JsonKey(name: 'target_type') String? targetType,@JsonKey(name: 'target_id') String? targetId,@JsonKey(name: 'latest_id') String latestId,@JsonKey(name: 'latest_actor_id') String? latestActorId,@JsonKey(name: 'latest_actor_first_name') String? latestActorFirstName,@JsonKey(name: 'latest_actor_last_name') String? latestActorLastName,@JsonKey(name: 'latest_actor_avatar_url') String? latestActorAvatarUrl,@JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson) int actorsCount,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'latest_created_at') DateTime latestCreatedAt, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupKey = null,Object? type = null,Object? targetType = freezed,Object? targetId = freezed,Object? latestId = null,Object? latestActorId = freezed,Object? latestActorFirstName = freezed,Object? latestActorLastName = freezed,Object? latestActorAvatarUrl = freezed,Object? actorsCount = null,Object? isRead = null,Object? latestCreatedAt = null,Object? metadata = null,}) {
  return _then(_NotificationModel(
groupKey: null == groupKey ? _self.groupKey : groupKey // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,targetType: freezed == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String?,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,latestId: null == latestId ? _self.latestId : latestId // ignore: cast_nullable_to_non_nullable
as String,latestActorId: freezed == latestActorId ? _self.latestActorId : latestActorId // ignore: cast_nullable_to_non_nullable
as String?,latestActorFirstName: freezed == latestActorFirstName ? _self.latestActorFirstName : latestActorFirstName // ignore: cast_nullable_to_non_nullable
as String?,latestActorLastName: freezed == latestActorLastName ? _self.latestActorLastName : latestActorLastName // ignore: cast_nullable_to_non_nullable
as String?,latestActorAvatarUrl: freezed == latestActorAvatarUrl ? _self.latestActorAvatarUrl : latestActorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,actorsCount: null == actorsCount ? _self.actorsCount : actorsCount // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,latestCreatedAt: null == latestCreatedAt ? _self.latestCreatedAt : latestCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
