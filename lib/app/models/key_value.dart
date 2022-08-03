import 'package:json_annotation/json_annotation.dart';
part 'key_value.g.dart';

@JsonSerializable()
class KeyValueModel {
  String? key;
  String? value;

  KeyValueModel({
    this.key,
    this.value,
  });
  factory KeyValueModel.fromJson(Map<String, dynamic> json) =>
      _$KeyValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$KeyValueModelToJson(this);
}
