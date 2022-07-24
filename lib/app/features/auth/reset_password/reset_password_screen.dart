import 'package:fe_ezlang_flashcard/app/features/base_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/reset_password/components/reset_password_desktop.dart';
import 'package:fe_ezlang_flashcard/app/features/auth/signin/signin_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/reset_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = 'resetPassword';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with BaseScreen {
  void submit(String email, String code, String newPassword) async {
    await handleResponse<void>(
        context,
        Provider.of<ResetPasswordController>(context, listen: false)
            .confirmResetPasswordCode(email, code, newPassword), (_) {
      showAlertDialog(context, S.of(context).reset_password,
          S.of(context).new_password_changed, () {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) =>
            ResetPasswordDesktop(callback: submit),
      ),
    );
  }
}
