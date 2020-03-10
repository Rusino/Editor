import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug9882 extends Bug {

  @override
  Widget build(BuildContext context) {
    return Bug(
        explanation: 'SkParagraph aborts with an assertion error in TextLine::iterateThroughVisualRuns related to the run width calculation.',
        child: Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: RichText(
              text: TextSpan(
                text: 'aaaa bbbb ',
                style: TextStyle(fontSize: 48.0, color: Colors.black, backgroundColor: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                      text: 'cc dd',
                      style:TextStyle(fontFamily: 'serif', fontSize: 64.0, backgroundColor: Colors.yellow)),
                ],
              ),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
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
