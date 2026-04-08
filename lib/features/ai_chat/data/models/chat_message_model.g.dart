// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _ChatMessageModel(
      id: json['id'] as String,
      text: json['text'] as String,
      isUser: json['isUser'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      listings:
          (json['listings'] as List<dynamic>?)
              ?.map(
                (e) => AiChatListingModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      isStopped: json['isStopped'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatMessageModelToJson(_ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'isUser': instance.isUser,
      'timestamp': instance.timestamp.toIso8601String(),
      'listings': instance.listings,
      'isStopped': instance.isStopped,
    };
