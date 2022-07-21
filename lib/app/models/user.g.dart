// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      status: json['status'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'address': instance.address,
      'mobile': instance.mobile,
      'status': instance.status,
      'roles': instance.roles,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
