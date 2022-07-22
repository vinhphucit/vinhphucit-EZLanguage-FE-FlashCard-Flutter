import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/pageable_categories.dart';
import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';
import 'package:flutter/foundation.dart';

abstract class FlashCardDataSource {
  Future<PageableCategoriesModel> getCategories(
      {int? start, int? limit, String? query});

  Future<CategoryModel> createCategory(
      {String? title, String? description, String? imageUrl});
  Future<CategoryModel> updateCategory(String id,
      {String? title, String? description, String? imageUrl});
}
