import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior, PointerDeviceKind;
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

class Bug9970 extends Bug {

  @override
  Widget build(BuildContext context) {

    return Bug(
        explanation: 'The second character should render using the glyph for the HK locale.  But currently with SkParagraph the two characters look identical.',
        child: Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: RichText(
              textDirection: TextDirection.ltr,
              text: TextSpan(
                  text: '\u904d  ',
                  style: TextStyle(
                      fontFamily: 'locltest',
                      fontSize: 48.0,
                      color: Colors.black,
                      locale: Locale('ko')),
                  children: <TextSpan>[
                    TextSpan(text: '\u904d',
                        style: TextStyle(locale: new Locale('zh', 'HK'))),
                  ]
              ),
            )
        )
    ));
  }

  Future<bool> test(WidgetTester tester) async {
    bool success = true;
    // TODO: Take a snapshot
    await tester.pumpAndSettle();
    await tester.pump(delay);
    return success;
  }
}



