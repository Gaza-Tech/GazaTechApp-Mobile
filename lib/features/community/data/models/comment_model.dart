// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'post_author_model.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

PostAuthorModel? _authorFromJson(dynamic value) {
  if (value is Map<String, dynamic>) return PostAuthorModel.fromJson(value);
  return null;
}

int _likesCountFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is List && value.isNotEmpty) {
    final first = value.first;
    if (first is Map<String, dynamic>) {
      return (first['count'] as num?)?.toInt() ?? 0;
    }
  }
  return 0;
}

int _repliesCountFromJson(dynamic value) {
  if (value == null) return 0;
  if (value is List && value.isNotEmpty) {
    final first = value.first;
    if (first is Map<String, dynamic>) {
      return (first['count'] as num?)?.toInt() ?? 0;
    }
  }
  return 0;
}

@freezed
abstract class CommentModel with _$CommentModel {
  const CommentModel._();

  const factory CommentModel({
    @JsonKey(name: 'comment_id') required String commentId,
    @JsonKey(name: 'post_id') required String postId,
    @JsonKey(name: 'author_id') required String authorId,
    required String content,
    @JsonKey(name: 'is_edited') @Default(false) bool isEdited,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'parent_comment_id') String? parentCommentId,
    @JsonKey(name: 'users', fromJson: _authorFromJson) PostAuthorModel? author,
    @JsonKey(name: 'community_comments_likes', fromJson: _likesCountFromJson)
    @Default(0)
    int likesCount,
    @JsonKey(name: 'community_post_comments', fromJson: _repliesCountFromJson)
    @Default(0)
    int repliesCount,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  String get authorName {
    if (author == null) return '';
    return '${author!.firstName} ${author!.lastName}'.trim();
  }
}
