//refer to fd-project-management-master
import 'dart:io';

import 'package:fe_ezlang_flashcard/app/config/themes/app_theme.dart';
import 'package:fe_ezlang_flashcard/app/features/activate_account/activate_account_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/dashboard/dashboard_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/forgot_password/forgot_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/reset_password/reset_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/signin/signin_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/signup/signup_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/splash/splash_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/activate_account_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/app_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/forgot_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/reset_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/signin_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('FlashCard');
    setWindowMinSize(const Size(400, 300));
  }

  runApp(const FlashCardApp());
}

class FlashCardApp extends StatelessWidget {
  const FlashCardApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResetPasswordController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ActivateAccountController(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashScreen(),
        theme: AppTheme.basic,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          SignInScreen.routeName: (context) => const SignInScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          ForgotPasswordScreen.routeName: (context) =>
              const ForgotPasswordScreen(),
          ResetPasswordScreen.routeName: (context) =>
              const ResetPasswordScreen(),
          ActivateAccountScreen.routeName: (context) =>
              const ActivateAccountScreen(),
          DashboardScreen.routeName: (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
