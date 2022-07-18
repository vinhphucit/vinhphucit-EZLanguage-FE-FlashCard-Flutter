import 'package:fe_ezlang_flashcard/app/features/signup/components/signup_desktop.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = 'signUp';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) {
          return SignUpDesktop();
        },
      ),
    );
  }
}
