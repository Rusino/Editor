import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'bug.dart';
import 'utils.dart';

class Singles extends Bug {

  Singles({ String explanation, Widget child}) : super(key: 'Stress', explanation: explanation, child: child);

  math.Random random = math.Random(0);
  final arabic = 'غظضذخثتشرقصفعسنملكيطحزوهدجبأ';
  final bengali = 'ঀঁংঃঅআইঈউঊঋঌএঐওঔকখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযরলশষসহ়ঽািীুূৃৄেৈোৌ্ৎৗড়ঢ়য়ৠৡৢৣ০১২৩৪৫৬৭৮৯ৰৱ৲৳৴৵৶৷৸৹৺৻';
  final english = 'abcdefghijklmnopqrstuvwxyz';

  @override
  Widget build(BuildContext context) {

    controller.text = generateRandomText();
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
        generateText: generateRandomText,
    );
  }

  @override
  String generateRandomText() {

    final List<String> alphabets = [
      english,
      bengali,
      arabic,
    ];

    final lang = random.nextInt(alphabets.length);
    final alphabet = alphabets[lang];

    final words = random.nextInt(2000);
    String text = '';
    for (int i = 0; i < words; ++i) {
        if (i > 0) {
            text += ' ';
        }

        final word = random.nextInt(20);
        for (int j = 0; j < word; ++j) {
            final index = random.nextInt(alphabet.length);
            final char = alphabet[index];
            text += char;
        }
    }
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
      final text = generateRandomText();
      print('>>> $text <<');
      await tester.showKeyboard(textFormField);
      tester.testTextInput.updateEditingValue(TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
        composing: TextRange(start: 0, end: text.length),
      ));
      await tester.pumpAndSettle();
      //await tester.pump(delay);
    }
    return success;
  }


}
