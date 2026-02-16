// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @JsonKey(name: 'marketplace_category_id') required String id,
    required String name,
    @JsonKey(name: 'name_ar') String? nameAr,
    required String slug,
    String? description,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
