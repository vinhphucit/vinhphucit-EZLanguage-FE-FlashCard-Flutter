// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      json['accessToken'] as String,
      json['accessTokenExpiresAt'] as int,
      json['refreshToken'] as String,
      json['refreshTokenExpiresAt'] as int,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiresAt': instance.refreshTokenExpiresAt,
    };
