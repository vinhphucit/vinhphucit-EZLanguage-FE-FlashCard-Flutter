import 'package:fe_ezlang_flashcard/app/shared_components/form_button.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/form_text_field.dart';
import 'package:fe_ezlang_flashcard/generated/l10n.dart';
import 'package:fe_ezlang_flashcard/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// import 'package:fe_ezlang_flashcard/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    group('SignInScreen', () {
      testWidgets('Invalid input', (WidgetTester tester) async {
        await tester.pumpWidget(FlashCardApp());

        await tester.pumpAndSettle();
        // ex
        var emailWidget = find.byKey(ValueKey('k_signin_email'));
        var passwordWidget = find.byKey(ValueKey('k_signin_password'));
        var signInWidget = find.byKey(ValueKey('k_signin_submit_btn'));

        await tester.enterText(emailWidget, 'admin');
        await tester.enterText(passwordWidget, 'adminpass');
        await tester.tap(signInWidget);

        await tester.pumpAndSettle();

        expect(find.text('Invalid email!'), findsOneWidget);

        await tester.enterText(emailWidget, 'admintest');
        await tester.enterText(passwordWidget, '');
        await tester.tap(signInWidget);

        await tester.pumpAndSettle();

        expect(find.text('Password is too short!'), findsOneWidget);

        //move to signup screen
        await tester.tap(find.byKey(ValueKey('k_signin_signup_btn')));
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(ValueKey('signup_back')));
        await tester.pumpAndSettle();

        //move to forgot password
        await tester.tap(find.byKey(ValueKey('k_signin_forgotpassword_btn')));
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(ValueKey('forgot_password_back')));
        await tester.pumpAndSettle();

        expect(find.text('Password is too short!'), findsOneWidget);
      });
    });
  });
}
