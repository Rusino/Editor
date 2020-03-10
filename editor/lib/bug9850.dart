import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug9850 extends Bug {

  @override
  Widget build(BuildContext context) {

    final text = 'ffi';
    controller.text = text;

    return Bug(
        explanation: 'It should be possible to position the cursor after '
                     'the first or second "f" in the "ffi" ligature.',
        child: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextFormField(
                key: key,
                decoration: const InputDecoration(border: OutlineInputBorder(), fillColor: Colors.grey),
                controller: controller,
                showCursor: true,
                focusNode: focusNode,
                autofocus: true,
              ),
            )
        )
    );
  }

  Future<bool> test(WidgetTester tester) async {

    bool success = true;
    focusNode.requestFocus();
    await tester.idle();

    success &= controller.selection.baseOffset == controller.selection.extentOffset;
    final x3 = controller.selection.baseOffset;
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowLeft);
    await tester.idle();
    await tester.pump(delay);

    success &= controller.selection.baseOffset == controller.selection.extentOffset;
    final x2 = controller.selection.baseOffset;
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowLeft);
    await tester.idle();
    await tester.pump(delay);

    success &= controller.selection.baseOffset == controller.selection.extentOffset;
    final x1 = controller.selection.baseOffset;
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowLeft);
    await tester.idle();
    await tester.pump(delay);

    success &= x3 > x2 && x2 > x1;

    return success;
  }
}
