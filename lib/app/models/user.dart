import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? title;
  String? address;
  String? mobile;
  String? status;
  List<UserModel>? roles;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.title,
      this.address,
      this.email,
      this.mobile,
      this.status,
      this.roles,
      this.createdAt,
      this.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
