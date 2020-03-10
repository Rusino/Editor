import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug9968 extends Bug {

  @override
  Widget build(BuildContext context) {
    return Bug(
        explanation: 'The app exits with an assertion failure:\n'
                     'ASSERT: 326.175781 != 360.000000\n'
                     '../../third_party/skia/modules/skparagraph/src/TextLine.cpp:904: fatal error: "assert(false)',
        child: Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Text('AAAAA \u{1f600} BBBBB CCCCC DDDDD EEEEE',
              style: TextStyle(fontSize: 36.0),
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

