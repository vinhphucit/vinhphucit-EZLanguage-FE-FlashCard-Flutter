import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:flutter/material.dart';

class FlashCardHomeController with ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoadingCategories = true;
  List<CategoryModel> _categories = [];

  bool get isLoading {
    return _isLoadingCategories;
  }

  void _setLoadingCategory(bool loading) {
    if (loading != _isLoadingCategories) {
      _isLoadingCategories = loading;
      notifyListeners();
    }
  }

  List<CategoryModel> get categories {
    return _categories;
  }

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  Future<void> getCategories({int? start, int? limit, String? query}) async {
    try {
      _setLoadingCategory(true);
      var response = await Repository.getInstance()
          .getCategories(limit: limit, query: query, start: start);
      _categories = response.items ?? [];
    } catch (e) {
    } finally {
      _setLoadingCategory(false);
    }
  }

  void addToCategory(CategoryModel data) async {
    _categories = [data, ..._categories];
    notifyListeners();
  }
}
