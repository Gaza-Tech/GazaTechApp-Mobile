// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      commentId: json['comment_id'] as String,
      postId: json['post_id'] as String,
      authorId: json['author_id'] as String,
      content: json['content'] as String,
      isEdited: json['is_edited'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      author: _authorFromJson(json['users']),
      likesCount: json['community_comments_likes'] == null
          ? 0
          : _likesCountFromJson(json['community_comments_likes']),
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'post_id': instance.postId,
      'author_id': instance.authorId,
      'content': instance.content,
      'is_edited': instance.isEdited,
      'created_at': instance.createdAt.toIso8601String(),
      'users': instance.author,
      'community_comments_likes': instance.likesCount,
    };
