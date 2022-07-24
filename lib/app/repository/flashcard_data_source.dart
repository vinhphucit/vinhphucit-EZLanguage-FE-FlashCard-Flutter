import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/flashcard.dart';
import 'package:fe_ezlang_flashcard/app/models/pageable_categories.dart';
import 'package:fe_ezlang_flashcard/app/models/pageable_flashcards.dart';
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

  Future<PageableFlashcardsModel> getFlashcards(String categoryId,
      {int? limit, String? query, int? start});

  Future<FlashcardModel> createFlashcard(String categoryId,
      {String? title, String? description});

  Future<FlashcardModel> updateFlashcard(String id,
      {String? title, String? description});
}
