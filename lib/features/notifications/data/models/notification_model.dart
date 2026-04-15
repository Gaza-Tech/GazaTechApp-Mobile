// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'notification_type.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

NotificationType _typeFromJson(dynamic value) =>
    NotificationType.fromString(value as String);

String _typeToJson(NotificationType type) => type.value;

int _actorsCountFromJson(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 1;
  return 1;
}

@freezed
abstract class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    @JsonKey(name: 'group_key') required String groupKey,
    @JsonKey(name: 'type', fromJson: _typeFromJson, toJson: _typeToJson)
    required NotificationType type,
    @JsonKey(name: 'target_type') String? targetType,
    @JsonKey(name: 'target_id') String? targetId,
    @JsonKey(name: 'latest_id') required String latestId,
    @JsonKey(name: 'latest_actor_id') String? latestActorId,
    @JsonKey(name: 'latest_actor_first_name') String? latestActorFirstName,
    @JsonKey(name: 'latest_actor_last_name') String? latestActorLastName,
    @JsonKey(name: 'latest_actor_avatar_url') String? latestActorAvatarUrl,
    @JsonKey(name: 'actors_count', fromJson: _actorsCountFromJson)
    @Default(1)
    int actorsCount,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'latest_created_at') required DateTime latestCreatedAt,
    @Default({}) Map<String, dynamic> metadata,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  String get actorName {
    final first = latestActorFirstName ?? '';
    final last = latestActorLastName ?? '';
    return '$first $last'.trim();
  }

  /// For comment-related notifications, the post_id lives in metadata.
  String? get navigationPostId {
    if (targetType == 'post') return targetId;
    final fromMeta = metadata['post_id'];
    if (fromMeta is String) return fromMeta;
    return null;
  }
}
