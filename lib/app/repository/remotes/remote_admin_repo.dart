import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';

import '../auth_data_source.dart';
import 'admin_api_service.dart';

class RemoteAdminRepo implements AuthDataSource {
  late AuthApiService _adminApiService;
  RemoteAdminRepo() {
    _adminApiService = AuthApiService();
  }

  @override
  Future<Session> signIn(String email, String password) async {
    var res = await _adminApiService.signIn(email, password);
    return res;
  }

  @override
  Future<Session> refreshToken(String token) async {
    var res = await _adminApiService.refreshToken(token);
    return res;
  }

  @override
  Future<void> signOut(String token) async {
    await _adminApiService.signOut(token);
  }

  @override
  Future<UserModel> signUp(
      String email, String password, String firstName, String lastName) async {
    return await _adminApiService.signUp(email, password, firstName, lastName);
  }
}
