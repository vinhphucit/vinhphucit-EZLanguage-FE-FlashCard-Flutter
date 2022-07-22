import 'package:fe_ezlang_flashcard/app/features/base_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/forgot_password/components/forgot_password_desktop.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/reset_password/reset_password_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/forgot_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = 'forgotPassword';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with BaseScreen {
  void submit(String email) async {
    await handleResponse<void>(
        context,
        Provider.of<ForgotPasswordController>(context, listen: false)
            .requestResetPassword(email), () {
      showAlertDialog(context, S.of(context).reset_password,
          S.of(context).request_reset_password_successfully_alert, () {
        Navigator.pushReplacementNamed(context, ResetPasswordScreen.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) =>
            ForgotPasswordDesktop(callback: submit),
      ),
    );
  }
}
