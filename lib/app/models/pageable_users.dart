// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:fe_ezlang_flashcard/app/models/user.dart';

class PageableUsersModel {
  PageableUsersModel({
    this.items,
    this.start,
    this.limit,
    this.totalItems,
    this.query,
  });

  List<UserModel>? items;
  int? start;
  int? limit;
  int? totalItems;
  String? query;

  factory PageableUsersModel.fromJson(Map<String, dynamic> json) =>
      PageableUsersModel(
        items: List<UserModel>.from(
            json["items"].map((x) => UserModel.fromJson(x))),
        start: json["start"],
        limit: json["limit"],
        totalItems: json["totalItems"],
        query: json["query"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "start": start,
        "limit": limit,
        "totalItems": totalItems,
        "query": query,
      };
}
