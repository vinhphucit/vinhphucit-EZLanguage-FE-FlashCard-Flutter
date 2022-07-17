import 'dart:convert';

import 'package:fe_ezlang_flashcard/app/models/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static const String _prefSession = 'session';
  static const String _prefAccessToken = 'access_token';

  static void saveSession(Session? session) async {
    final prefs = await SharedPreferences.getInstance();
    if (session == null) {
      prefs.remove(_prefSession);
      prefs.remove(_prefAccessToken);
    } else {
      final currentSession = json.encode(session);
      prefs.setString(_prefSession, currentSession);
      prefs.setString(_prefAccessToken, session.accessToken);
    }
  }

  static Future<Session?> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_prefSession)) {
      String? prefSession = prefs.getString(_prefSession);
      if (prefSession == null) return null;
      final extractedUserData =
          json.decode(prefs.getString(_prefSession)!) as Map<String, dynamic>;

      return Session.fromJson(extractedUserData);
    }
    return null;
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_prefAccessToken)) {
      String? prefToken = prefs.getString(_prefAccessToken);
      return prefToken;
    }
    return null;
  }
}
