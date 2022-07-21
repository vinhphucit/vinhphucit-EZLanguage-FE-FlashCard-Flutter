import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class ErrorRes {
  String description;
  int code;

  ErrorRes(this.code, this.description);

  factory ErrorRes.fromJson(Map<String, dynamic> json) =>
      _$ErrorResFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResToJson(this);
}
