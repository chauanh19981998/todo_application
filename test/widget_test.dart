import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/page/home_page.dart';
import 'package:todo_application/provider/tasks_provider.dart';

void main() {
  testWidgets(
      'tap on the floating action button when title is empty and get error',
      (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    ));

    //find widget in this case
    final addTitleField = find.byKey(const ValueKey('addTitleField'));
    final addButton = find.byKey(const ValueKey('addButton'));

    // execute  test
    await tester.enterText(addTitleField, "");
    await tester.tap(addButton);
    await tester.pump();

    //check output
    expect(find.text('Title cannot be empty'), findsOneWidget);
  });
}
