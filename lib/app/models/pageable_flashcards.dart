// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/flashcard.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pageable_flashcards.g.dart';

@JsonSerializable()
class PageableFlashcardsModel {
  PageableFlashcardsModel(
    this.items,
    this.start,
    this.limit,
    this.totalItems,
    this.query,
  );

  List<FlashcardModel>? items;
  int? start;
  int? limit;
  int? totalItems;
  String? query;

  factory PageableFlashcardsModel.fromJson(Map<String, dynamic> json) =>
      _$PageableFlashcardsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PageableFlashcardsModelToJson(this);
}
