import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class PermissionModel {
  String? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  PermissionModel(
      {this.id, this.name, this.code, this.updatedAt, this.createdAt});
  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}
