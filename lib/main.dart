//refer to fd-project-management-master
import 'package:fe_ezlang_flashcard/app/config/themes/app_theme.dart';
import 'package:fe_ezlang_flashcard/app/features/dashboard/dashboard_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/forgot_password/forgot_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/signin/signin_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/signup/signup_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/splash/splash_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/app_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/forgot_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
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
        )
      ],
      child: MaterialApp(
        localizationsDelegates: [
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
          DashboardScreen.routeName: (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
