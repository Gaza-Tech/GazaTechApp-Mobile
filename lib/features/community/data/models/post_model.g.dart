// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  postId: json['post_id'] as String,
  authorId: json['author_id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  postCategory: json['post_category'] as String,
  contentStatus: json['content_status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  publishedAt: json['published_at'] == null
      ? null
      : DateTime.parse(json['published_at'] as String),
  author: _authorFromJson(json['users']),
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
  attachmentUrls: json['community_posts_attachments'] == null
      ? const []
      : _attachmentUrlsFromJson(json['community_posts_attachments']),
  isLiked: json['isLiked'] as bool? ?? false,
  isBookmarked: json['isBookmarked'] as bool? ?? false,
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'author_id': instance.authorId,
      'title': instance.title,
      'content': instance.content,
      'post_category': instance.postCategory,
      'content_status': instance.contentStatus,
      'created_at': instance.createdAt.toIso8601String(),
      'published_at': instance.publishedAt?.toIso8601String(),
      'users': instance.author,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'community_posts_attachments': instance.attachmentUrls,
      'isLiked': instance.isLiked,
      'isBookmarked': instance.isBookmarked,
    };
