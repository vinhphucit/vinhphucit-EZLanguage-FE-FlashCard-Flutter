// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hey There,`
  String get hey_there {
    return Intl.message(
      'Hey There,',
      name: 'hey_there',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcome_back {
    return Intl.message(
      'Welcome Back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Signin`
  String get signin {
    return Intl.message(
      'Signin',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgot_password {
    return Intl.message(
      'Forgot your password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get reset_password {
    return Intl.message(
      'Reset password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email!`
  String get invalid_email {
    return Intl.message(
      'Invalid email!',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short!`
  String get invalid_password {
    return Intl.message(
      'Password is too short!',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid first name`
  String get invalid_first_name {
    return Intl.message(
      'Invalid first name',
      name: 'invalid_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Invalid last name`
  String get invalid_last_name {
    return Intl.message(
      'Invalid last name',
      name: 'invalid_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get create_an_account {
    return Intl.message(
      'Create an Account',
      name: 'create_an_account',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our `
  String get toc_head {
    return Intl.message(
      'By creating an account, you agree to our ',
      name: 'toc_head',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get toc_and {
    return Intl.message(
      ' and ',
      name: 'toc_and',
      desc: '',
      args: [],
    );
  }

  /// `Conditions of Use`
  String get toc_conditions_of_use {
    return Intl.message(
      'Conditions of Use',
      name: 'toc_conditions_of_use',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Notice`
  String get toc_privacy_notice {
    return Intl.message(
      'Privacy Notice',
      name: 'toc_privacy_notice',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account yet? `
  String get do_not_have_account {
    return Intl.message(
      'Don’t have an account yet? ',
      name: 'do_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password? That's okay, it happens to everyone!\nPlease provide your email to reset your password.`
  String get forgot_password_consolation {
    return Intl.message(
      'Forgot your password? That\'s okay, it happens to everyone!\nPlease provide your email to reset your password.',
      name: 'forgot_password_consolation',
      desc: '',
      args: [],
    );
  }

  /// `Send Instruction`
  String get send_instruction {
    return Intl.message(
      'Send Instruction',
      name: 'send_instruction',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'vn'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
