import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  Future<void> requestResetPassword(String email) async {
    try {
      _isLoading = true;
      notifyListeners();
      await Repository.getInstance().requestResetPassword(email);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
