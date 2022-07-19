import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../../main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('The first screen has a spinning', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var indicator = find.byType(CircularProgressIndicator);
      expect(indicator, findsOneWidget);
    });
  });
}
