import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';

import '../auth_data_source.dart';
import 'auth_api_service.dart';

class RemoteAdminRepo implements AuthDataSource {
  late AuthApiService _authApiService;
  RemoteAdminRepo() {
    _authApiService = AuthApiService();
  }

  @override
  Future<Session> signIn(String email, String password) async {
    var res = await _authApiService.signIn(email, password);
    return res;
  }

  @override
  Future<Session> refreshToken(String token) async {
    var res = await _authApiService.refreshToken(token);
    return res;
  }

  @override
  Future<void> signOut(String token) async {
    await _authApiService.signOut(token);
  }

  @override
  Future<UserModel> signUp(
      String email, String password, String firstName, String lastName) async {
    return await _authApiService.signUp(email, password, firstName, lastName);
  }

  @override
  Future<void> requestResetPassword(String email) async {
    return await _authApiService.requestResetPassword(email);
  }

  @override
  Future<void> confirmResetPasswordCode(
      String email, String code, String newPassword) async {
    return await _authApiService.confirmResetPasswordCode(
        email, code, newPassword);
  }

  @override
  Future<void> activateAccountByCode(String email, String code) async {
    return await _authApiService.activateAccountByCode(email, code);
  }
}
