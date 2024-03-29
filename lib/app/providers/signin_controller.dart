import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:fe_ezlang_flashcard/app/utils/shared_pref_utils.dart';
import 'package:flutter/material.dart';

class SignInController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  Future<void> signIn(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      // await Future.delayed(const Duration(seconds: 2));
      Session session = await Repository.getInstance().signIn(email, password);
      SharedPrefUtils.saveSession(session);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
