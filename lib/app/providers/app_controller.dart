import 'dart:async';

import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:fe_ezlang_flashcard/app/repository/respository.dart';
import 'package:fe_ezlang_flashcard/app/utils/shared_pref_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppController with ChangeNotifier {
  Session? _currentSession;
  DateTime? _expiryDate;
  Timer? _refreshTokenTimer;

  bool get isAuth {
    return _currentSession != null;
  }

  Future<bool> tryAutoLogin() async {
    _currentSession = await SharedPrefUtils.getSession();
    if (_currentSession == null) return false;
    _expiryDate = DateTime.fromMillisecondsSinceEpoch(
        (_currentSession?.accessTokenExpiresAt ?? 0) * 1000);

    if (_expiryDate!.isBefore(DateTime.now())) {
      bool isRefreshTokenSuccessfully = await _tryRefreshToken();
      if (!isRefreshTokenSuccessfully) return false;
    }
    notifyListeners();

    return true;
  }

  Future<void> signOut() async {
    try {
      await Repository.getInstance()
          .signOut(_currentSession?.refreshToken ?? '');
    } catch (e) {
    } finally {
      _handleNewSession(null);
    }
  }

  Future<bool> _tryRefreshToken() async {
    var refreshTokenDate = DateTime.fromMillisecondsSinceEpoch(
        _currentSession!.refreshTokenExpiresAt * 1000);
    if (refreshTokenDate.isAfter(DateTime.now())) {
      Session result = await Repository.getInstance()
          .refreshToken(_currentSession!.refreshToken);
      _handleNewSession(result);
      return true;
    }
    return false;
  }

  Future<void> _handleNewSession(Session? session) async {
    _currentSession = session;
    SharedPrefUtils.saveSession(session);
    if (session == null) {
      _expiryDate = null;
      _cancelRefreshToken();
    } else {
      _expiryDate = DateTime.fromMillisecondsSinceEpoch(
          session.accessTokenExpiresAt * 1000);
      _autoRefreshToken();
    }
  }

  void _autoRefreshToken() {
    if (_refreshTokenTimer != null) {
      _refreshTokenTimer?.cancel();
    }
    final timeToExpiry = _expiryDate?.difference(DateTime.now()).inSeconds;
    _refreshTokenTimer = Timer(
        Duration(seconds: timeToExpiry == null ? 0 : timeToExpiry - 60),
        _refreshToken);
  }

  void _cancelRefreshToken() {
    if (_refreshTokenTimer != null) {
      _refreshTokenTimer?.cancel();
    }
  }

  void _refreshToken() async {
    try {
      Session result = await Repository.getInstance()
          .refreshToken(_currentSession!.refreshToken);
      await _handleNewSession(result);
    } catch (e) {
      rethrow;
    } finally {}
  }
}
