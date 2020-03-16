import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior, PointerDeviceKind;
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug9969 extends Bug {

  final text = 'sff iii errty okkkkk ffgggvv bnnnnnnnn vvvvvv';

  @override
  Widget build(BuildContext context) {

    controller.text = text;
    //controller.selection = TextSelection(baseOffset: index, extentOffset: text.length);

    return Bug(
        explanation: '1. Type a few lines of text.\n'
                     '2. Long press on a word to select it.\n'
                     '3. Drag the end selection handle to the next line.\n\n'
                     'The start selection handle will move to the beginning of its line. '
                     'This should not happen.',
        child: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            textAlign: TextAlign.justify,
            maxLines: 5,
            enableInteractiveSelection: true,
            controller: controller,
            showCursor: true,
            focusNode: focusNode,
            autofocus: true,
          ),
        )
    ));
  }

  Future<bool> test(WidgetTester tester) async {
    bool success = true;

    focusNode.requestFocus();
    await tester.idle();

    // Select the center of the first line
    final rect = tester.getRect(find.byType(TextFormField).first);
    await tester.tapAt(rect.topCenter);
    await tester.pumpAndSettle();

    await tester.sendKeyDownEvent(LogicalKeyboardKey.shift);
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    await tester.sendKeyUpEvent(LogicalKeyboardKey.shift);
    await tester.pumpAndSettle();

    success &=

        controller.selection.baseOffset == (text.length / 2).floor();
    success &= controller.selection.extentOffset == text.length;

    return success;
  }
}

