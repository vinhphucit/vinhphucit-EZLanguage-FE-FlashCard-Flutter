// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableCategoriesModel _$PageableCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    PageableCategoriesModel(
      (json['items'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['start'] as int?,
      json['limit'] as int?,
      json['totalItems'] as int?,
      json['query'] as String?,
    );

Map<String, dynamic> _$PageableCategoriesModelToJson(
        PageableCategoriesModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'start': instance.start,
      'limit': instance.limit,
      'totalItems': instance.totalItems,
      'query': instance.query,
    };
