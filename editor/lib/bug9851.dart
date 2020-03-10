import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

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
    final binding = tester.binding;

    final box1 = tester.renderObject(find.byType(Container).first) as RenderBox;
    // Take a screenshot here

    await binding.setSurfaceSize(
        Size(binding.window.physicalSize.height / binding.window.devicePixelRatio,
            binding.window.physicalSize.width / binding.window.devicePixelRatio));
    await tester.pumpAndSettle();
    await tester.pump(delay);
    final box2 = tester.renderObject(find.byType(Container).first) as RenderBox;
    success &= box1.size != box2.size;

    await binding.setSurfaceSize(
        Size(binding.window.physicalSize.width / binding.window.devicePixelRatio,
            binding.window.physicalSize.height / binding.window.devicePixelRatio));
    await tester.pumpAndSettle();
    await tester.pump(delay);
    final box3 = tester.renderObject(find.byType(Container).first) as RenderBox;
    // Take a screenshot here and compare with the first screenshot (must be the same)
    success &= box1.size == box3.size;

    return success;
  }
}