import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';
import 'utils.dart';

class Bug10075 extends Bug {

  @override
  Widget build(BuildContext context) {

    final text = 'য়ৠঝোণ৺ঢ়মৈবৗৗঘথফড়৭২খসঢ়ৃঢ়ঁ৷থডঈঽলবনদ২ৢৃঀজঝ৩ঠ৪৫৯০ঌয়্মওৗ৲গখদ৹ঈ৴৹ঢ়ৄএৡফণহলঈ৲থজোৱেঀকৰঀ ষজঝঃাখ শঽএমংি';
    controller.text = text;

    return Bug(
        explanation: 'Start adding any characters from the left until the last '
                     'few letters move to the next line. '
                     'Observe that the last grapheme \'মংি\' is broken.'
                     'It should be moved to the next line entirely.',
        child: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextFormField(
                key: key,
                decoration: const InputDecoration(border: OutlineInputBorder(), fillColor: Colors.grey),
                style: TextStyle(fontSize: 8),
                controller: controller,
                showCursor: true,
                maxLines: 5,
              ),
            )
        )
    );
  }

  Offset getCenterOffset(RenderEditable paragraph, int pos) {
    final rect = paragraph.getLocalRectForCaret(TextPosition(offset: pos));
    return paragraph.localToGlobal(rect.center);
  }

  Future<bool> test(WidgetTester tester) async {

    bool success = false;

    final textFormField = find.byType(TextFormField);
    final paragraph = findRenderEditable(tester);

    final initialText = controller.text;
    final initialOffset = getCenterOffset(paragraph, initialText.length);

    String current = initialText;
    await tester.showKeyboard(textFormField);
    while (current.length < initialText.length * 2) {
      await tester.showKeyboard(find.byType(TextField));
      current = 'a' + current;
      tester.testTextInput.updateEditingValue(TextEditingValue(
        text: current,
        selection: TextSelection.collapsed(offset: current.length),
        composing: TextRange(start: 0, end: current.length),
      ));
      await tester.pump();

      final currentOffset = getCenterOffset(paragraph, current.length);
      if (currentOffset.dy > initialOffset.dy) {
          // We moved to the next line
          // Let's make sure the entire grapheme is on the next line
          final graphemeOffset = getCenterOffset(paragraph, current.length - 6);
          success = (graphemeOffset.dy == currentOffset.dy);
          break;
      }
    }
    return success;
  }
}
