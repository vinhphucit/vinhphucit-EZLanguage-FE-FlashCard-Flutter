class PermissionModel {
  String? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  PermissionModel(
      {this.id, this.name, this.code, this.updatedAt, this.createdAt});
  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      PermissionModel(
        id: json["id"]!,
        name: json["name"],
        code: json["code"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
