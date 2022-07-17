import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';

import 'auth_data_source.dart';
import 'remotes/remote_admin_repo.dart';

class Repository implements AuthDataSource {
  static Repository? _instance;

  AuthDataSource remoteAdminRepo = RemoteAdminRepo();

  static Repository getInstance() {
    _instance ??= Repository();
    return _instance!;
  }

  @override
  Future<Session> signIn(String email, String password) async {
    return await remoteAdminRepo.signIn(email, password);
  }

  @override
  Future<Session> refreshToken(String token) async {
    return await remoteAdminRepo.refreshToken(token);
  }

  @override
  Future<void> signOut(String token) async {
    await remoteAdminRepo.signOut(token);
  }

  @override
  Future<UserModel> signUp(
      String email, String password, String firstName, String lastName) async {
    return await remoteAdminRepo.signUp(email, password, firstName, lastName);
  }
}
