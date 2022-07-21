import 'package:json_annotation/json_annotation.dart';

import 'permission.dart';
part 'role.g.dart';

@JsonSerializable()
class RoleModel {
  String? id;
  String? name;
  List<PermissionModel>? permissions;
  String? createdAt;
  String? updatedAt;
  RoleModel(
      {this.id, this.name, this.permissions, this.createdAt, this.updatedAt});

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}
