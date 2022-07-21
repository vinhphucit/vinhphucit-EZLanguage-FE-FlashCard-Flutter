import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class CategoryModel {
  String? id;
  String? title;
  String? description;
  String? parentCategoryId;
  String? imageUrl;
  String? userId;
  String? createdAt;
  String? updatedAt;
  CategoryModel(this.id, this.title, this.description, this.parentCategoryId,
      this.imageUrl, this.userId, this.createdAt, this.updatedAt);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
