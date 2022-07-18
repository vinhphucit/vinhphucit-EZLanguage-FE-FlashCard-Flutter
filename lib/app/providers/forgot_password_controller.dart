import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:fe_ezlang_flashcard/app/utils/shared_pref_utils.dart';
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
      // await Repository.getInstance().requestResetPassword(email);
      await Future.delayed(Duration(seconds: 5));
    } catch (e) {
      throw e;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
