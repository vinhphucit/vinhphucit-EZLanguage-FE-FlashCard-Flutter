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

  /// `Activate`
  String get activate {
    return Intl.message(
      'Activate',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
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

  /// `Re-enter password`
  String get reenter_password {
    return Intl.message(
      'Re-enter password',
      name: 'reenter_password',
      desc: '',
      args: [],
    );
  }

  /// `New pasword`
  String get new_password {
    return Intl.message(
      'New pasword',
      name: 'new_password',
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

  /// `Passwords did not match. Try again.`
  String get invalid_password_reenter {
    return Intl.message(
      'Passwords did not match. Try again.',
      name: 'invalid_password_reenter',
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

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation! \nYou've created your own account successfully. We will send you an activation code in a moment, please check your email and re-enter that code in the next screen to activate your account. \nThanks and happy learning.`
  String get signup_successfully_alert {
    return Intl.message(
      'Congratulation! \nYou\'ve created your own account successfully. We will send you an activation code in a moment, please check your email and re-enter that code in the next screen to activate your account. \nThanks and happy learning.',
      name: 'signup_successfully_alert',
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

  /// ` and `
  String get toc_and {
    return Intl.message(
      ' and ',
      name: 'toc_and',
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

  /// `Already have code?`
  String get already_have_code {
    return Intl.message(
      'Already have code?',
      name: 'already_have_code',
      desc: '',
      args: [],
    );
  }

  /// `Already have activation code?`
  String get already_have_activation_code {
    return Intl.message(
      'Already have activation code?',
      name: 'already_have_activation_code',
      desc: '',
      args: [],
    );
  }

  /// `You've requested reset your password successfully. A code will be sent to your email for a short while, please check your email and enter the sent code into the next screen alongside with your new password.`
  String get request_reset_password_successfully_alert {
    return Intl.message(
      'You\'ve requested reset your password successfully. A code will be sent to your email for a short while, please check your email and enter the sent code into the next screen alongside with your new password.',
      name: 'request_reset_password_successfully_alert',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation! \nYour new password has been changed successfully. `
  String get new_password_changed {
    return Intl.message(
      'Congratulation! \nYour new password has been changed successfully. ',
      name: 'new_password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Activate Account`
  String get activate_account {
    return Intl.message(
      'Activate Account',
      name: 'activate_account',
      desc: '',
      args: [],
    );
  }

  /// `Please check the checkbox to agree with our terms and conditions.`
  String get tof_accept_required {
    return Intl.message(
      'Please check the checkbox to agree with our terms and conditions.',
      name: 'tof_accept_required',
      desc: '',
      args: [],
    );
  }

  /// `Add More`
  String get add_more {
    return Intl.message(
      'Add More',
      name: 'add_more',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continues {
    return Intl.message(
      'Continue',
      name: 'continues',
      desc: '',
      args: [],
    );
  }

  /// `Title is invalid`
  String get invalid_title {
    return Intl.message(
      'Title is invalid',
      name: 'invalid_title',
      desc: '',
      args: [],
    );
  }

  /// `Description is invalid`
  String get invalid_description {
    return Intl.message(
      'Description is invalid',
      name: 'invalid_description',
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
      Locale.fromSubtags(languageCode: 'vi'),
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
