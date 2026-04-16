// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_author_model.freezed.dart';
part 'post_author_model.g.dart';

@freezed
abstract class PostAuthorModel with _$PostAuthorModel {
  const factory PostAuthorModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _PostAuthorModel;

  factory PostAuthorModel.fromJson(Map<String, dynamic> json) =>
      _$PostAuthorModelFromJson(json);
}
