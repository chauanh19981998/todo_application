import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_application/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
        'tap on the floating action button when title is empty and get error',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      //find text form title and button add
      final addTitleField = find.byKey(const ValueKey('addTitleField'));
      final Finder fab = find.byKey(const ValueKey('addButton'));

      // Emulate a tap on the floating action button.
      await tester.enterText(addTitleField, "");
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('Title cannot be empty'), findsOneWidget);
    });
  });
}
