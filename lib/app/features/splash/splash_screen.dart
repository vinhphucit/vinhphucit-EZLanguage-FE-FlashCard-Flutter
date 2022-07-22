import 'package:fe_ezlang_flashcard/app/features/dashboard/dashboard_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/signin/signin_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/app_controller.dart';
import 'package:fe_ezlang_flashcard/app/utils/shared_pref_utils.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<AppController>(context, listen: false).tryAutoLogin().then(
      (value) async {
        await S.load(Locale(await SharedPrefUtils.getLocale() ??
            S.delegate.supportedLocales.first.languageCode));
        await Future.delayed(const Duration(seconds: 1));
        if (value) {
          Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
