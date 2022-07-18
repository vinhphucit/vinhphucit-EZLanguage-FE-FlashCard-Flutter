import 'package:fe_ezlang_flashcard/app/features/activate_account/components/activate_account_desktop.dart';
import 'package:fe_ezlang_flashcard/app/features/base_screen.dart';
import 'package:fe_ezlang_flashcard/app/features/reset_password/components/reset_password_desktop.dart';
import 'package:fe_ezlang_flashcard/app/features/signin/signin_screen.dart';
import 'package:fe_ezlang_flashcard/app/providers/activate_account_controller.dart';
import 'package:fe_ezlang_flashcard/app/providers/reset_password_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivateAccountScreen extends StatefulWidget {
  static const routeName = 'activateAccount';
  const ActivateAccountScreen({Key? key}) : super(key: key);

  @override
  State<ActivateAccountScreen> createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen>
    with BaseScreen {
  void submit(String email, String code) async {
    await handleResponse<void>(
        context,
        Provider.of<ActivateAccountController>(context, listen: false)
            .activateByCode(email, code), () {
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
            ActivateAccountDesktop(callback: submit),
      ),
    );
  }
}
