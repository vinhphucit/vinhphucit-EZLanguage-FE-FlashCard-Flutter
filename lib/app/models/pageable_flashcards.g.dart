// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_flashcards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableFlashcardsModel _$PageableFlashcardsModelFromJson(
        Map<String, dynamic> json) =>
    PageableFlashcardsModel(
      (json['items'] as List<dynamic>?)
          ?.map((e) => FlashcardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['start'] as int?,
      json['limit'] as int?,
      json['totalItems'] as int?,
      json['query'] as String?,
    );

Map<String, dynamic> _$PageableFlashcardsModelToJson(
        PageableFlashcardsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'start': instance.start,
      'limit': instance.limit,
      'totalItems': instance.totalItems,
      'query': instance.query,
    };
