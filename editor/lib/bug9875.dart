import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug9875 extends Bug {

  @override
  Widget build(BuildContext context) {
    return Bug(
        explanation: 'The text should not be clipped on the right side.'
                     'The clipping appeared to happen only when the text style uses letter spacing.',
        child: Material(
          child: Directionality(
              textDirection: TextDirection.ltr,
              child: Opacity(opacity: 0.8,
                  child: Text(
                    'PESTO',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 48.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        letterSpacing: 20.0,
                        background: Paint()
                          ..color = Colors.red),
                  )
              )
          )
      )
    );
  }

  Future<bool> test(WidgetTester tester) async {
    bool success = true;
    // TODO: Create a screenshot
    await tester.pumpAndSettle();
    await tester.pump(delay);
    return success;
  }
}
