import 'package:fe_ezlang_flashcard/app/features/base_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/dashboard/dashboard_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/signin/components/signin_desktop.dart';
import 'package:fe_ezlang_flashcard/app/providers/signin_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'signin';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with BaseScreen {
  void submit(String email, String password) async {
    await handleResponse<void>(
        context,
        Provider.of<SignInController>(context, listen: false)
            .signIn(email, password), () {
      Navigator.pushNamed(context, DashboardScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) {
          return SignInDesktop(callback: submit);
        },
      ),
    );
  }
}
