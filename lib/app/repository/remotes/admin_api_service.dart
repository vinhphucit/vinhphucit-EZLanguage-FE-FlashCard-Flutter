import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';

import 'base_api_service.dart';

class AuthApiService extends BaseApiService {
  final String _baseUrl = 'https://ez-lang-alpha.herokuapp.com/ezlang/';
  final String _signInEndpoint = 'auth/signIn';
  final String _signOutEndpoint = 'auth/signOut';
  final String _refreshTokenEndpoint = 'auth/refreshToken';
  final String _signUpEndpoint = 'auth/signUp';
  final String _requestResetPaswordEndpoint = 'auth/resetPassword';

  Future<Session> signIn(String email, String password) async {
    return Session.fromJson(await post(
        '$_baseUrl$_signInEndpoint', {'email': email, 'password': password}));
  }

  Future<Session> refreshToken(String token) async {
    return Session.fromJson(
        await post('$_baseUrl$_refreshTokenEndpoint', {'token': token}));
  }

  Future<void> signOut(String token) async {
    await post('$_baseUrl$_signOutEndpoint', {'token': token});
  }

  Future<UserModel> signUp(
      email, String password, String firstName, String lastName) async {
    return UserModel.fromJson(await post('$_baseUrl$_signUpEndpoint', {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName
    }));
  }

  Future<void> requestResetPassword(String email) async {
    return await post('$_baseUrl$_requestResetPaswordEndpoint');
  }
}
