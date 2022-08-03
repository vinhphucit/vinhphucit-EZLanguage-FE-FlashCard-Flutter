// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashcardModel _$FlashcardModelFromJson(Map<String, dynamic> json) =>
    FlashcardModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      userId: json['userId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    )
      ..imageUrls = (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => KeyValueModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..soundUrls = (json['soundUrls'] as List<dynamic>?)
          ?.map((e) => KeyValueModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..references = (json['references'] as List<dynamic>?)
          ?.map((e) => KeyValueModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..masteredLevel = json['masteredLevel'] as String?;

Map<String, dynamic> _$FlashcardModelToJson(FlashcardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'soundUrls': instance.soundUrls,
      'references': instance.references,
      'masteredLevel': instance.masteredLevel,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
