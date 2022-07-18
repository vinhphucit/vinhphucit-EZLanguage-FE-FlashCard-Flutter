import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:flutter/material.dart';

class ResetPasswordController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  Future<void> confirmResetPasswordCode(
      String email, String code, String newPassword) async {
    try {
      _isLoading = true;
      notifyListeners();
      await Repository.getInstance()
          .confirmResetPasswordCode(email, code, newPassword);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
