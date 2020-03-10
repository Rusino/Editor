import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug9881 extends Bug {

  @override
  Widget build(BuildContext context) {
    return Bug(
        explanation: 'The text should show a red background extending through the font\'s ascent and descent.'
                     'However, if the text is wrapped in an Opacity layer, then the output will clip '
                     'the bottom portion of the background representing the descent below the text\'s baseline.',
        child: Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Opacity(opacity: 0.8,
              child: Text(
                'ABCDE',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 48.0, background: Paint()..color = Colors.red),
              ),
            )
        )
    ));
  }

  Future<bool> test(WidgetTester tester) async {
    bool success = true;
    // TODO: Create a screenshot
    await tester.pumpAndSettle();
    await tester.pump(delay);
    return success;
  }
}
