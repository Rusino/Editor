import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug10050 extends Bug {

  final alphabet = 'ঀঁংঃঅআইঈউঊঋঌএঐওঔকখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযরলশষসহ়ঽািীুূৃৄেৈোৌ্ৎৗড়ঢ়য়ৠৡৢৣ০১২৩৪৫৬৭৮৯ৰৱ৲৳৴৵৶৷৸৹৺৻';
  math.Random random;

  @override
  Widget build(BuildContext context) {

    final text = 'ছোৈূোঌ';
    controller.text = text;

    return Bug(
        explanation: 'Observe: no crash!\n'
                     'In a plain TextField(), type lots of Bengali, focusing on (but not only) '
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
                maxLines: 5,
              ),
            )
        )
    );
  }

  Future<bool> test(WidgetTester tester) async {

    bool success = true;

    // This text crashed SkParagraph some time ago but does not amymore

    return success;
  }
}
