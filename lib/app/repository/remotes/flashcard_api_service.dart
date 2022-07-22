import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/pageable_categories.dart';
import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';

import 'base_api_service.dart';

class FlashcardApiService extends BaseApiService {
  final String _baseUrl = 'https://ez-lang-flashcard.herokuapp.com/flashcard/';
  final String _categoriesEndpoint = 'categories';

  Future<PageableCategoriesModel> getCategories(
      {int? start, int? limit, String? query}) async {
    return PageableCategoriesModel.fromJson(
        await get('$_baseUrl$_categoriesEndpoint'));
  }

  Future<CategoryModel> createCategory(String? title, String? description,
      String? imageUrl, String? parentCategoryId) async {
    return CategoryModel.fromJson(await post('$_baseUrl$_categoriesEndpoint',
        {title, description, imageUrl, parentCategoryId}));
  }

  Future<CategoryModel> updateCategory(String id, String? title,
      String? description, String? imageUrl, String? parentCategoryId) async {
    return CategoryModel.fromJson(await put('$_baseUrl$_categoriesEndpoint/$id',
        {title, description, imageUrl, parentCategoryId}));
  }
}
