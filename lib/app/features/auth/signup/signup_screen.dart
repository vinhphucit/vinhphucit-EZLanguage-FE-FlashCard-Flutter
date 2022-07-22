import 'package:fe_ezlang_flashcard/app/features/auth/activate_account/activate_account_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/base_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/signup/components/signup_desktop.dart';
import 'package:fe_ezlang_flashcard/app/providers/signup_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = 'signUp';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with BaseScreen {
  void submit(
      String email, String password, String firstName, String lastName) async {
    await handleResponse<void>(
        context,
        Provider.of<SignUpController>(context, listen: false)
            .signUp(email, password, firstName, lastName), () {
      showAlertDialog(context, S.of(context).signup,
          S.of(context).signup_successfully_alert, () {
        Navigator.pushNamed(context, ActivateAccountScreen.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) {
          return SignUpDesktop(submitForm: submit);
        },
      ),
    );
  }
}
