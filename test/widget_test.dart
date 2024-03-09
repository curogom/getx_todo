import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_todo/data/service/storage_service.dart';

import 'package:getx_todo/main.dart';

void main() {
  testWidgets('HomeScreen has a title and a floating action button',
      (WidgetTester tester) async {
    await Get.putAsync(() => StorageService().init(isTest: true));

    await tester.pumpWidget(const TodoApp(
      isTest: true,
    ));

    final addButton = find.ancestor(
      of: find.byIcon(Icons.add),
      matching: find.byType(FloatingActionButton),
    );

    expect(find.text('Todo - Home'), findsOneWidget);
    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    await tester.pumpAndSettle();

    expect(find.text('Todo - New Task'), findsOneWidget);

    final todoTextField = find.ancestor(
      of: find.text('What to do?'),
      matching: find.byType(TextFormField),
    );

    expect(todoTextField, findsOneWidget);

    await tester.tap(todoTextField);
    tester.testTextInput.enterText('New Task');

    final submitButton = find.text('Save New Task');

    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(find.text('New Task'), findsOneWidget);
    expect(find.text('todo'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pumpAndSettle();

    expect(find.text('doing'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pumpAndSettle();

    expect(find.text('done'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    expect(find.text('No Todos'), findsOneWidget);
  });
}
