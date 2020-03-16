import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'bug.dart';

import 'dart:ui' as ui;

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path/path.dart' as path;
import 'package:process/process.dart';
import 'dart:io';

class Bug9875 extends Bug {

  bool foundAndEqual = false;

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
                        background: Paint()..color = Colors.red),
                  )
              )
          )
      )
    );
  }

  void findParagraph(RenderObject parent) {
    parent.visitChildren((child) {
      if (child is RenderParagraph) {
        var para = child as RenderParagraph;
        String text = para.text.toPlainText();
        if (text == 'PESTO') {
          final max = para.getMaxIntrinsicWidth(para.size.height);
          final min = para.getMinIntrinsicWidth(para.size.height);
          foundAndEqual = (max == min);
        }
      } else {
        findParagraph(child);
      }
    });
  }

  Future<bool> test(WidgetTester tester) async {

    // Get the actual image
    final repaintBoundary = find.byType(RepaintBoundary).evaluate().first.renderObject;
    assert(!repaintBoundary.debugNeedsPaint);

    // Find the right paragraph and check the widths (they were wrong when the bug was present)
    foundAndEqual = false;
    findParagraph(repaintBoundary);
    return foundAndEqual;
  }
}
