// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:editor/main.dart';
import 'package:editor/bug.dart';

Future<void> testBugs(WidgetTester tester) async {
  final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding
      .ensureInitialized() as TestWidgetsFlutterBinding;

  // Ensure the containing Card is small enough that we don't expand too
  // much, resulting in our custom margin being ignored.
  await binding.setSurfaceSize(
      Size(binding.window.physicalSize.width / binding.window.devicePixelRatio,
           binding.window.physicalSize.height / binding.window.devicePixelRatio));

  await tester.pumpWidget(MyApp());
  await tester.pumpAndSettle();

  final MaterialApp myApp = tester.firstWidget(find.byType(MaterialApp));
  await tester.tap(find.byKey(Key('Bugs')));
  await tester.pumpAndSettle();

  final list = myApp.routes.entries.toList();
  for (var route in list) {
    if (route.key.toString().startsWith('Bug100')) {
      await tester.tap(find.byKey(Key(route.key)));
      await tester.pumpAndSettle();

      final bug = tester.firstWidget(find.byKey(Key('Bug'))) as Bug;
      if (bug != null) {
        final result = await bug.test(tester);
        if (!result) {
          print('Failed ' + route.key.toString());
        }
      }
      await tester.pump(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(Key('Back')));
      await tester.pumpAndSettle();
    }
  }

  await tester.tap(find.byKey(Key('Back')));
  await tester.pumpAndSettle();
}

void main() {

  //testWidgets('Bugs', testBugs);

  testWidgets('Bugs', (WidgetTester tester) async {
    final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding
        .ensureInitialized() as TestWidgetsFlutterBinding;

    // Ensure the containing Card is small enough that we don't expand too
    // much, resulting in our custom margin being ignored.
    await binding.setSurfaceSize(
        Size(binding.window.physicalSize.width / binding.window.devicePixelRatio,
            binding.window.physicalSize.height / binding.window.devicePixelRatio));

    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    final MaterialApp myApp = tester.firstWidget(find.byType(MaterialApp));
    await tester.tap(find.byKey(Key('Bugs')));
    await tester.pumpAndSettle();

    final list = myApp.routes.entries.toList();
    for (var route in list) {
      if (route.key.toString().startsWith('Bug')) {
        await tester.tap(find.byKey(Key(route.key)));
        await tester.pumpAndSettle();

        final bug = tester.firstWidget(find.byKey(Key('Bug'))) as Bug;
        if (bug != null) {
          final result = await bug.test(tester);
          if (!result) {
            print('Failed ' + route.key.toString());
          }
        }
        await tester.pump(const Duration(milliseconds: 3000));
        await tester.tap(find.byKey(Key('Back')));
        await tester.pumpAndSettle();
      }
    }

    await tester.tap(find.byKey(Key('Back')));
    await tester.pumpAndSettle();
  });

  //exit(0);

}



