import 'package:fe_ezlang_flashcard/app/models/pageable_categories.dart';
import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';
import 'package:fe_ezlang_flashcard/app/repository/flashcard_data_source.dart';

import 'auth_data_source.dart';
import 'remotes/remote_admin_repo.dart';

class Repository implements AuthDataSource, FlashCardDataSource {
  static Repository? _instance;

  final AuthDataSource _remoteAuthRepo = RemoteAdminRepo();
  final FlashCardDataSource _remoteFlashcardRepo = RemoteAdminRepo();

  static Repository getInstance() {
    _instance ??= Repository();
    return _instance!;
  }

  @override
  Future<Session> signIn(String email, String password) async {
    return await _remoteAuthRepo.signIn(email, password);
  }

  @override
  Future<Session> refreshToken(String token) async {
    return await _remoteAuthRepo.refreshToken(token);
  }

  @override
  Future<void> signOut(String token) async {
    await _remoteAuthRepo.signOut(token);
  }

  @override
  Future<UserModel> signUp(
      String email, String password, String firstName, String lastName) async {
    return await _remoteAuthRepo.signUp(email, password, firstName, lastName);
  }

  @override
  Future<void> requestResetPassword(String email) async {
    return await _remoteAuthRepo.requestResetPassword(email);
  }

  @override
  Future<void> confirmResetPasswordCode(
      String email, String code, String newPassword) async {
    return await _remoteAuthRepo.confirmResetPasswordCode(
        email, code, newPassword);
  }

  @override
  Future<void> activateAccountByCode(String email, String code) async {
    return await _remoteAuthRepo.activateAccountByCode(email, code);
  }

  @override
  Future<PageableCategoriesModel> getCategories(
      {int? start, int? limit, String? query}) async {
    return await _remoteFlashcardRepo.getCategories(
        limit: limit, query: query, start: start);
  }
}
