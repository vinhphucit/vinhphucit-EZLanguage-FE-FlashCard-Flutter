import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:flutter/material.dart';

class CreateCategoryController with ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  List<CategoryModel> _categories = [];

  bool get isLoading {
    return _isLoading;
  }

  List<CategoryModel> get categories {
    return _categories;
  }

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  Future<void> create({int? start, int? limit, String? query}) async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await Repository.getInstance()
          .getCategories(limit: limit, query: query, start: start);
      _categories = response.items ?? [];
    } catch (e) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
