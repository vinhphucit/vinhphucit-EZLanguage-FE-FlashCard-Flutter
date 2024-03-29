import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/models/flashcard.dart';
import 'package:fe_ezlang_flashcard/app/models/pageable_categories.dart';
import 'package:fe_ezlang_flashcard/app/models/pageable_flashcards.dart';
import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/models/user.dart';
import 'package:fe_ezlang_flashcard/app/repository/flashcard_data_source.dart';
import 'package:fe_ezlang_flashcard/app/repository/remotes/flashcard_api_service.dart';
import 'package:fe_ezlang_flashcard/main.dart';

import '../auth_data_source.dart';
import 'auth_api_service.dart';

class RemoteAdminRepo implements AuthDataSource, FlashCardDataSource {
  late AuthApiService _authApiService;
  late FlashcardApiService _flashcardApiService;
  RemoteAdminRepo() {
    _authApiService = AuthApiService();
    _flashcardApiService = FlashcardApiService();
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

  @override
  Future<PageableCategoriesModel> getCategories(
      {int? start, int? limit, String? query}) async {
    return await _flashcardApiService.getCategories(
        limit: limit, start: start, query: query);
  }

  @override
  Future<CategoryModel> createCategory(
      {String? title, String? description, String? imageUrl}) async {
    return await _flashcardApiService.createCategory(
        title, description, imageUrl, null);
  }

  @override
  Future<CategoryModel> updateCategory(String id,
      {String? title, String? description, String? imageUrl}) async {
    return await _flashcardApiService.updateCategory(
        id, title, description, imageUrl, null);
  }

  @override
  Future<FlashcardModel> createFlashcard(String categoryId,
      {String? title, String? description}) async {
    return await _flashcardApiService.createFlashcard(
        categoryId, title, description);
  }

  @override
  Future<PageableFlashcardsModel> getFlashcards(String categoryId,
      {int? limit, String? query, int? start}) async {
    return await _flashcardApiService.getFlashcards(
        categoryId: categoryId, limit: limit, start: start, query: query);
  }

  @override
  Future<FlashcardModel> updateFlashcard(String id,
      {String? title, String? description}) async {
    return await _flashcardApiService.updateFlashcard(id, title, description);
  }
}
