import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math' as math;

RenderEditable findRenderEditable(WidgetTester tester) {
  final RenderObject root = tester.renderObject(find.byType(EditableText));
  expect(root, isNotNull);

  RenderEditable renderEditable;
  void recursiveFinder(RenderObject child) {
    if (child is RenderEditable) {
      renderEditable = child;
      return;
    }
    child.visitChildren(recursiveFinder);
  }
  root.visitChildren(recursiveFinder);
  expect(renderEditable, isNotNull);
  return renderEditable;
}

RenderParagraph findParagraph(RenderObject parent) {
  RenderParagraph result = null;
  parent.visitChildren((child) {
    if (result == null) {
        if (child is RenderParagraph) {
          result = child as RenderParagraph;
        } else {
          result = findParagraph(child);
        }
    }
    return result;
  });

  return result;
}

String generateText(math.Random random, String alphabet) {

  final size = random.nextInt(100) * 10;
  String text = '';
  for (int i = 0; i < size; ++i) {
    final index = random.nextInt(alphabet.length);
    final char = alphabet[index];
    text += char;
  }
  return text;
}