//refer to fd-project-management-master
import 'dart:io';

import 'package:fe_ezlang_flashcard/app/config/themes/app_theme.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/activate_account/activate_account_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/dashboard/dashboard_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/flashcard/create_category/create_category_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcard_home/flashcard_home.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/reset_password/reset_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/signin/signin_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/signup/signup_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcard_home/flashcard_home.dart';
import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcard_study/flashcard_study_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/flashcard/flashcards/flashcards_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/splash/splash_screen.dart';
import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/providers/activate_account_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/app_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/create_category_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/dashboard_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcard_home_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcard_study_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcards_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/forgot_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/reset_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/signin_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  if (kIsWeb) {
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('FlashCard');
      setWindowMinSize(const Size(400, 300));
    }
  }
  runApp(FlashCardApp());
}

class FlashCardApp extends StatelessWidget {
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
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FlashCardHomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateCategoryController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FlashcardsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FlashcardStudyController(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name == FlashcardsScreen.routeName) {
            final args = settings.arguments as CategoryModel;
            return MaterialPageRoute(
              builder: (context) {
                return FlashcardsScreen(category: args);
              },
            );
          } else if (settings.name == FlashcardStudyScreen.routeName) {
            final args = settings.arguments as FlashcardStudyScreenArguments;
            return MaterialPageRoute(
              builder: (context) {
                return FlashcardStudyScreen(arguments: args);
              },
            );
          }
          return null;
        },
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
          FlashCardHomeScreen.routeName: (context) =>
              const FlashCardHomeScreen(),
          CreateCategoryScreen.routeName: (context) =>
              const CreateCategoryScreen()
        },
      ),
    );
  }
}
