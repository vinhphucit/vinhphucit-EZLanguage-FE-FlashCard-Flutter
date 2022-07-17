import 'package:fe_ezlang_flashcard/app/features/forgot_password/components/forgot_password_desktop.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = 'forgotPassword';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) => ForgotPasswordDesktop(),
      ),
    );
  }
}
