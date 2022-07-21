// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pageable_categories.g.dart';

@JsonSerializable()
class PageableCategoriesModel {
  PageableCategoriesModel(
    this.items,
    this.start,
    this.limit,
    this.totalItems,
    this.query,
  );

  List<CategoryModel>? items;
  int? start;
  int? limit;
  int? totalItems;
  String? query;

  factory PageableCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$PageableCategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PageableCategoriesModelToJson(this);
}
