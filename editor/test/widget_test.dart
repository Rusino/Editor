// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:editor/main.dart';
import 'package:editor/bug9850.dart';
import 'package:editor/bug9851.dart';

Future<void> testBugs(WidgetTester tester) async {
  final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding
      .ensureInitialized() as TestWidgetsFlutterBinding;
  final Size screenSize = binding.window.physicalSize;

  final Size originalSize = binding.renderView.size;

  // Ensure the containing Card is small enough that we don't expand too
  // much, resulting in our custom margin being ignored.
  await binding.setSurfaceSize(Size(screenSize.width / binding.window.devicePixelRatio, screenSize.height / binding.window.devicePixelRatio));

  //binding.window.textScaleFactorTestValue = 3.0;
  await tester.pumpWidget(MyApp());
  await tester.pump();
  await tester.pump();

  final MaterialApp myApp = tester.firstWidget(find.byType(MaterialApp));
  final app = tester.renderObject(find.byKey(Key('MaterialApp'))) as RenderBox;
  final container = tester.renderObject(find.byKey(Key('Container'))) as RenderBox;
  final column = tester.renderObject(find.byKey(Key('Column'))) as RenderBox;

  final list = myApp.routes.entries.toList();
  for (var route in list) {
    if (route.key.toString() != 'Back') {
      await tester.tap(find.byKey(Key(route.key)));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(Key('Back')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 5000));
    }
  }

}

void main() {
  testWidgets('Bugs', testBugs);
}



