// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostAuthorModel _$PostAuthorModelFromJson(Map<String, dynamic> json) =>
    _PostAuthorModel(
      userId: json['user_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$PostAuthorModelToJson(_PostAuthorModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar_url': instance.avatarUrl,
    };
