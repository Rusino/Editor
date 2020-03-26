import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

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

  Future<bool> test(WidgetTester tester) async {

    bool success = true;

    return success;
  }
}
