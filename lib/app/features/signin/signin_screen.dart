import 'package:fe_ezlang_flashcard/app/features/signin/components/signin_desktop.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'signin';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) {
          return SignInDesktop();
        },
      ),
    );
  }
}
