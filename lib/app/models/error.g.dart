// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorRes _$ErrorResFromJson(Map<String, dynamic> json) => ErrorRes(
      json['code'] as int,
      json['description'] as String,
    );

Map<String, dynamic> _$ErrorResToJson(ErrorRes instance) => <String, dynamic>{
      'description': instance.description,
      'code': instance.code,
    };
