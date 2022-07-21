import 'package:fe_ezlang_flashcard/app/models/pageable_categories.dart';
import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';
import 'package:flutter/foundation.dart';

abstract class FlashCardDataSource {
  Future<PageableCategoriesModel> getCategories(
      {int? start, int? limit, String? query});
}
