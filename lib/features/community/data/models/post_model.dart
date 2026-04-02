// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'post_author_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

PostAuthorModel? _authorFromJson(dynamic value) {
  if (value is Map<String, dynamic>) return PostAuthorModel.fromJson(value);
  return null;
}

List<String> _attachmentUrlsFromJson(dynamic value) {
  if (value is List) {
    return value
        .whereType<Map<String, dynamic>>()
        .map((e) => e['file_url'] as String? ?? '')
        .where((url) => url.isNotEmpty)
        .toList();
  }
  return [];
}

@freezed
abstract class PostModel with _$PostModel {
  const PostModel._();

  const factory PostModel({
    @JsonKey(name: 'post_id') required String postId,
    @JsonKey(name: 'author_id') required String authorId,
    required String title,
    required String content,
    @JsonKey(name: 'post_category') required String postCategory,
    @JsonKey(name: 'content_status') required String contentStatus,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    @JsonKey(name: 'users', fromJson: _authorFromJson) PostAuthorModel? author,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
    @JsonKey(name: 'comments_count') @Default(0) int commentsCount,
    @JsonKey(
      name: 'community_posts_attachments',
      fromJson: _attachmentUrlsFromJson,
    )
    @Default([])
    List<String> attachmentUrls,
    @Default(false) bool isLiked,
    @Default(false) bool isBookmarked,
    @Default(false) bool isReported,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  String get authorName {
    if (author == null) return '';
    return '${author!.firstName} ${author!.lastName}'.trim();
  }
}
