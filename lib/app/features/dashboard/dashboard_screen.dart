import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/features/dashboard/components/dashboard_desktop.dart';
import 'package:fe_ezlang_flashcard/app/features/signin/signin_screen.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/responsible_builder.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/search_field.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/time_text.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = 'dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        desktopBuilder: (context, constraints) => DashboardDesktop(),
      ),
    );
  }
}
