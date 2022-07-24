import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/flashcard.dart';
import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:flutter/material.dart';

class FlashcardsController with ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = true;
  List<FlashcardModel> _flashcards = [];

  bool get isLoading {
    return _isLoading;
  }

  void set _setLoadingCategory(bool loading) {
    if (loading != _isLoading) {
      _isLoading = loading;
      notifyListeners();
    }
  }

  List<FlashcardModel> get flashcards {
    return _flashcards;
  }

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  Future<void> getFlashcards(String categoryId,
      {int? start, int? limit, String? query}) async {
    try {
      _setLoadingCategory = true;
      var response = await Repository.getInstance()
          .getFlashcards(categoryId, limit: limit, query: query, start: start);
      _flashcards = response.items ?? [];
    } catch (e) {
    } finally {
      _setLoadingCategory = false;
    }
  }

  Future<FlashcardModel?> createFlashcard(String categoryId,
      {String? title, String? description}) async {
    try {
      _setLoadingCategory = true;
      var response = await Repository.getInstance()
          .createFlashcard(categoryId, title: title, description: description);
      return response;
    } catch (e) {
    } finally {
      _setLoadingCategory = false;
    }
  }

  addFlashcard(FlashcardModel? newFlashcard) {
    _flashcards = [newFlashcard!, ..._flashcards];
  }
}
