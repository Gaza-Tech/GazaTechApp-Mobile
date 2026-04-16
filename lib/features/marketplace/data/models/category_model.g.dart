// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: json['marketplace_category_id'] as String,
      name: json['name'] as String,
      nameAr: json['name_ar'] as String?,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      parentId: json['parent_id'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'marketplace_category_id': instance.id,
      'name': instance.name,
      'name_ar': instance.nameAr,
      'slug': instance.slug,
      'description': instance.description,
      'parent_id': instance.parentId,
      'is_active': instance.isActive,
    };
