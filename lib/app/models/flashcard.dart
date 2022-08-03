import 'package:fe_ezlang_flashcard/app/models/key_value.dart';
import 'package:json_annotation/json_annotation.dart';
part 'flashcard.g.dart';

@JsonSerializable()
class FlashcardModel {
  String? id;
  String? title;
  String? description;
  List<KeyValueModel>? imageUrls;
  List<KeyValueModel>? soundUrls;
  List<KeyValueModel>? references;
  String? masteredLevel;
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
