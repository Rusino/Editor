import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'bug.dart';
import 'utils.dart';

class Mixed extends Bug {

  Mixed({ String explanation, Widget child}) : super(key: 'Stress', explanation: explanation, child: child);

  math.Random random = math.Random(0);

  @override
  Widget build(BuildContext context) {

    controller.text = generateMixedText();
    return Bug(
        explanation: 'In a plain TextField(), type lots of Arabic.\n'
                     'It should not crash at least.',
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
        ),
      generateText: generateMixedText,
    );
  }

  String generateMixedText() {

    final List<String> alphabets = [
      english,
      bengali,
      arabic,
      chinese,
    ];

    final words = random.nextInt(2000);
    final spaces = ' . , ; : ? ! ';
    String text = '';
    for (int i = 0; i < words; ++i) {
        final lang = random.nextInt(alphabets.length);
        final word = random.nextInt(20);
        final alphabet = alphabets[lang];
        for (int j = 0; j < word; ++j) {
            final index = random.nextInt(alphabet.length);
            final char = alphabet[index];
            text += char;
        }
        final space = random.nextInt(spaces.length);
        text += spaces[space];
    }
    text += '';
    return text;
  }

  Future<bool> test(WidgetTester tester) async {

    bool success = true;

    final textFormField = find.byType(TextFormField);
    for (int i = 0; i < 10; ++i) {
      if (super.finished) {
          return success;
      }
      random = math.Random(i);
      final text = generateMixedText();
      print('>>> $text <<');
      await tester.showKeyboard(textFormField);
      tester.testTextInput.updateEditingValue(TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
        composing: TextRange(start: 0, end: text.length),
      ));
      await tester.pump(delay);
    }

    return success;
  }
}
