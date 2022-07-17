import 'permission.dart';

class RoleModel {
  String? id;
  String? name;
  List<PermissionModel>? permissions;
  String? createdAt;
  String? updatedAt;
  RoleModel(
      {this.id, this.name, this.permissions, this.createdAt, this.updatedAt});

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        name: json["name"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        permissions: json["permissions"] == null
            ? null
            : List<PermissionModel>.from(
                json["permissions"].map((x) => PermissionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "permissions": permissions == null
            ? null
            : List<dynamic>.from(permissions!.map((x) => x.toJson())),
      };
}
