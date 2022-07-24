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

  Future<CategoryModel?> create({String? title, String? description}) async {
    try {
      _isLoading = true;
      notifyListeners();
      return await Repository.getInstance()
          .createCategory(title: title, description: description);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
