import 'package:json_annotation/json_annotation.dart';
part 'flashcard.g.dart';

@JsonSerializable()
class FlashcardModel {
  String? id;
  String? title;
  String? description;
  String? userId;
  String? createdAt;
  String? updatedAt;

  FlashcardModel({
    this.id,
    this.title,
    this.description,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });
  factory FlashcardModel.fromJson(Map<String, dynamic> json) =>
      _$FlashcardModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlashcardModelToJson(this);
}
