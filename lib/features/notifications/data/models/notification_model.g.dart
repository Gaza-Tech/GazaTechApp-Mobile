// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      groupKey: json['group_key'] as String,
      type: _typeFromJson(json['type']),
      targetType: json['target_type'] as String?,
      targetId: json['target_id'] as String?,
      latestId: json['latest_id'] as String,
      latestActorId: json['latest_actor_id'] as String?,
      latestActorFirstName: json['latest_actor_first_name'] as String?,
      latestActorLastName: json['latest_actor_last_name'] as String?,
      latestActorAvatarUrl: json['latest_actor_avatar_url'] as String?,
      actorsCount: json['actors_count'] == null
          ? 1
          : _actorsCountFromJson(json['actors_count']),
      isRead: json['is_read'] as bool? ?? false,
      latestCreatedAt: DateTime.parse(json['latest_created_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'group_key': instance.groupKey,
      'type': _typeToJson(instance.type),
      'target_type': instance.targetType,
      'target_id': instance.targetId,
      'latest_id': instance.latestId,
      'latest_actor_id': instance.latestActorId,
      'latest_actor_first_name': instance.latestActorFirstName,
      'latest_actor_last_name': instance.latestActorLastName,
      'latest_actor_avatar_url': instance.latestActorAvatarUrl,
      'actors_count': instance.actorsCount,
      'is_read': instance.isRead,
      'latest_created_at': instance.latestCreatedAt.toIso8601String(),
      'metadata': instance.metadata,
    };
