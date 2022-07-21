import 'package:fe_ezlang_flashcard/app/models/user.dart';
import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:flutter/material.dart';

class SignUpController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  Future<void> signUp(
      String email, String password, String firstName, String lastName) async {
    try {
      _isLoading = true;
      notifyListeners();
      // await Future.delayed(const Duration(seconds: 2));
      UserModel newUser = await Repository.getInstance()
          .signUp(email, password, firstName, lastName);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
