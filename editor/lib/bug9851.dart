import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';
import 'utils.dart';

class Bug9851 extends Bug {

  @override
  Widget build(BuildContext context) {

    return Bug(
        explanation: 'Rotate the screen, and then rotate it back to its original orientation.\n'
                     'The last two words in the last line of text will be overlapping '
                     'when the text is redrawn after the rotations.',
        child: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
            child: Text(
              'AAAAA BBBBB CCCCC DDDDD EEEEE FFFFF GGGGG HHHHH IIIII JJJJJ KKKKK LLLLL MMMMM NNNNN OOOOO PPPPP QQQQQ',
              style: TextStyle(fontSize: 36.0, foreground: Paint()..color = Colors.black),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
            )
        )
    ));
  }

  Future<bool> test(WidgetTester tester) async {

    bool success = true;

    final repaintBoundary = find.byType(RepaintBoundary).evaluate().first.renderObject;
    var paragraph = findParagraph(repaintBoundary);
    final box1 = paragraph.size;
    //tester.renderObject(find.byType(Container).first) as RenderBox;
    // Take a screenshot here

    await tester.binding.setSurfaceSize(
        Size(tester.binding.window.physicalSize.height / tester.binding.window.devicePixelRatio,
             tester.binding.window.physicalSize.width / tester.binding.window.devicePixelRatio));
    await tester.pumpAndSettle();
    await tester.pump(delay);

    final box2 = paragraph.size;
    success &= box1 != box2;

    await tester.binding.setSurfaceSize(
        Size(tester.binding.window.physicalSize.width / tester.binding.window.devicePixelRatio,
            tester.binding.window.physicalSize.height / tester.binding.window.devicePixelRatio));
    await tester.pumpAndSettle();
    await tester.pump(delay);
    final box3 = paragraph.size;
    // Take a screenshot here and compare with the first screenshot (must be the same)
    success &= box1 == box3;

    return success;
  }
}