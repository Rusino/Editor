import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug10049 extends Bug {

  math.Random random;
  final alphabet = 'ঀঁংঃঅআইঈউঊঋঌএঐওঔকখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযরলশষসহ়ঽািীুূৃৄেৈোৌ্ৎৗড়ঢ়য়ৠৡৢৣ০১২৩৪৫৬৭৮৯ৰৱ৲৳৴৵৶৷৸৹৺৻';
  final alphabet1 = 'abcdefghijklmnopqrstuvwxyz';
  @override
  Widget build(BuildContext context) {

    return Bug(
        explanation: 'I could not reproduce this bug so there is no fix and no test to test the fix.\n'
                     'Type in any plain TextField() in Bengali. '
                     'As the text scrolls when typing a lot of text, the caret will begin '
                     'to show up before the final (correct) position. The number of glyphs '
                     'of offset increases the more than you type. Manually moving the caret '
                     'back to the end does not fix it, as it rapidly shifts back to the offset position.',
        child: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextFormField(
                key: key,
                decoration: const InputDecoration(border: OutlineInputBorder(), fillColor: Colors.grey),
                style: TextStyle(fontSize: 8),
                controller: controller,
                showCursor: true,
                enableInteractiveSelection: true,
                focusNode: focusNode,
                autofocus: true,
                maxLines: 40,
              ),
            )
        )
    );
  }

  Future<bool> test(WidgetTester tester) async {
    // I could not reproduce this bug so there is not fix and no test :(

    bool success = true;
/*
    TestTextInput testTextInput = tester.binding.testTextInput;
    focusNode.requestFocus();
    await tester.idle();

    final textFormField = find.byType(TextFormField);
    for (int i = 0; i < 1; ++i) {
      random = math.Random(i);

      final size = random.nextInt(100) * 50;
      String text = '';
      for (int i = 0; i < size; ++i) {
        final index = random.nextInt(alphabet.length);
        final char = alphabet[index];
        text += char;

        await tester.enterText(textFormField, text);
        await tester.idle();
        await tester.pump(delay);

        for (int i = 0; i <= text.length + 1; ++i) {
            await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
            await tester.idle();
        }

        tester.testTextInput.updateEditingValue(
            TextEditingValue(
              text: text,
              selection: TextSelection.collapsed(offset: text.length),
            ));
        await tester.enterText(textFormField, text);
        await tester.sendKeyDownEvent(LogicalKeyboardKey.end);
        await tester.idle();

      }
      await tester.pump();
      print(i.toString() + ' >>> ' + text + ' <<<');
    }
*/
    return success;
  }
}
