import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/flashcard.dart';
import 'package:fe_ezlang_flashcard/app/models/pageable_categories.dart';
import 'package:fe_ezlang_flashcard/app/models/pageable_flashcards.dart';
import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';

import 'base_api_service.dart';

class FlashcardApiService extends BaseApiService {
  final String _baseUrl = 'https://ez-lang-flashcard.herokuapp.com/flashcard/';
  final String _categoriesEndpoint = 'categories';
  final String _flashcardsEndpoint = 'flashcards';

  Future<PageableCategoriesModel> getCategories(
      {int? start, int? limit, String? query}) async {
    return PageableCategoriesModel.fromJson(
        await get('$_baseUrl$_categoriesEndpoint'));
  }

  Future<CategoryModel> createCategory(String? title, String? description,
      String? imageUrl, String? parentCategoryId) async {
    return CategoryModel.fromJson(await post('$_baseUrl$_categoriesEndpoint', {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'parentCategoryId': parentCategoryId
    }));
  }

  Future<CategoryModel> updateCategory(String id, String? title,
      String? description, String? imageUrl, String? parentCategoryId) async {
    return CategoryModel.fromJson(await put('$_baseUrl$_categoriesEndpoint/$id',
        {title, description, imageUrl, parentCategoryId}));
  }

  Future<FlashcardModel> createFlashcard(
      String categoryId, String? title, String? description) async {
    return FlashcardModel.fromJson(await post('$_baseUrl$_flashcardsEndpoint', {
      'title': title,
      'description': description,
      'categoryId': categoryId
    }));
  }

  Future<PageableFlashcardsModel> getFlashcards(
      {required String categoryId,
      int? limit,
      int? start,
      String? query}) async {
    return PageableFlashcardsModel.fromJson(await get(
        '$_baseUrl$_categoriesEndpoint/$categoryId/$_flashcardsEndpoint'));
  }

  Future<FlashcardModel> updateFlashcard(
      String id, String? title, String? description) async {
    return FlashcardModel.fromJson(await put(
        '$_baseUrl$_flashcardsEndpoint/$id',
        {'title': title, 'description': description}));
  }
}
