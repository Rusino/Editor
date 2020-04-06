import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stress.dart';
import 'utils.dart';

class Bengali extends Stress {

  math.Random random;
  final alphabet = ' ঀঁংঃঅআইঈউঊঋঌএঐওঔকখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযরলশষসহ়ঽািীুূৃৄেৈোৌ্ৎৗড়ঢ়য়ৠৡৢৣ০১২৩৪৫৬৭৮৯ৰৱ৲৳৴৵৶৷৸৹৺৻';

  @override
  Widget build(BuildContext context) {

    return Stress(
        explanation: 'In a plain TextField(), type lots of Bengali, focusing on (but not only) '
                     'the top row of characters. I have not narrowed down a particular string '
                     '(since it crashes, and I dont understand what the contents I\'m typing is), '
                     'but some combinations result in a segfault.\n'
                     'This can take a little bit to repro, as it is only on particular combinations.',
        child: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextFormField(
                key: key,
                decoration: const InputDecoration(border: OutlineInputBorder(), fillColor: Colors.grey),
                style: TextStyle(fontSize: 8),
                controller: controller,
                showCursor: true,
                maxLines: 40,
              ),
            )
        )
    );
  }

  String generateText() {

    final size = random.nextInt(100) * 10;
    String text = '';
    for (int i = 0; i < size; ++i) {
      final index = random.nextInt(alphabet.length);
      final char = alphabet[index];
      text += char;
    }
    return text;
  }

  Future<bool> test(WidgetTester tester) async {

    bool success = true;

    final textFormField = find.byType(TextFormField);
    for (int i = 0; i < 100; ++i) {

      if (super.finished) {
        return success;
      }

      random = math.Random(i);
      final text = generateText();
      String current = '';
      await tester.showKeyboard(textFormField);
      for (int c = 0; c < text.length; ++c) {
          await tester.showKeyboard(find.byType(TextField));
          current += text[c];
          tester.testTextInput.updateEditingValue(TextEditingValue(
            text: current,
            selection: TextSelection.collapsed(offset: current.length),
            composing: TextRange(start: 0, end: current.length),
          ));
          await tester.pump();

          final paragraph = findRenderEditable(tester);

          final rect = paragraph.getLocalRectForCaret(TextPosition(offset: current.length));
          final offset = paragraph.localToGlobal(rect.center);
          final position = paragraph.getPositionForPoint(offset);
          if (position.offset != current.length) {
            final delta = current.length - position.offset;
            print('$c: $delta $position');
            print(i.toString() + ' >>> ' + current + ' <<<');
          }
      }
      await tester.pump(delay);
    }

    return success;
  }
}
