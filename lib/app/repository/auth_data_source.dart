import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';

abstract class AuthDataSource {
  Future<Session> signIn(String email, String password);
  Future<Session> refreshToken(String token);
  Future<void> signOut(String token);
  Future<void> requestResetPassword(String email);
  Future<UserModel> signUp(
      String email, String password, String firstName, String lastName);
  Future<void> confirmResetPasswordCode(
      String email, String code, String newPassword);
  Future<void> activateAccountByCode(String email, String code);
}
