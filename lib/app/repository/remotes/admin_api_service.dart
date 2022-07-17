import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';

import 'base_api_service.dart';

class AuthApiService extends BaseApiService {
  final String baseUrl = 'https://ez-lang-alpha.herokuapp.com/ezlang/';
  final String signInEndpoint = 'auth/signIn';
  final String signOutEndpoint = 'auth/signOut';
  final String refreshTokenEndpoint = 'auth/refreshToken';
  final String signUpEndpoint = 'auth/signUp';

  Future<Session> signIn(String email, String password) async {
    return Session.fromJson(await post(
        '$baseUrl$signInEndpoint', {'email': email, 'password': password}));
  }

  Future<Session> refreshToken(String token) async {
    return Session.fromJson(
        await post('$baseUrl$refreshTokenEndpoint', {'token': token}));
  }

  Future<void> signOut(String token) async {
    await post('$baseUrl$signOutEndpoint', {'token': token});
  }

  Future<UserModel> signUp(
      email, String password, String firstName, String lastName) async {
    return UserModel.fromJson(await post('$baseUrl$signUpEndpoint', {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName
    }));
  }
}
