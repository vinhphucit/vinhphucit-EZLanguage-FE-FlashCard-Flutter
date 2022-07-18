import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:flutter/material.dart';

class ActivateAccountController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  Future<void> activateByCode(String email, String code) async {
    try {
      _isLoading = true;
      notifyListeners();
      await Repository.getInstance().activateAccountByCode(email, code);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
