import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:fe_ezlang_flashcard/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    group('SignInScreen', () {
      testWidgets('Invalid Credential', (WidgetTester tester) async {
        app.main();

        await tester.pumpAndSettle();
        // ex
        var emailWidget = find.text('Email');
        var passwordWidget = find.text('Password');
        var signInWidget = find.byType(FormButton);
        var formTextField = find.byType(FormTextField);

        await tester.enterText(formTextField.first, 'admin');
        await tester.enterText(formTextField.last, 'adminpass');
        await tester.tap(signInWidget);

        await tester.pump();

        expect(find.text('Invalid email!'), findsWidgets);
      });
    });
  });
}
