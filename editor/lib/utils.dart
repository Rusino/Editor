import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math' as math;

final arabic = 'غظضذخثتشرقصفعسنملكيطحزوهدجبأ';
final bengali = 'ঀঁংঃঅআইঈউঊঋঌএঐওঔকখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযরলশষসহ়ঽািীুূৃৄেৈোৌ্ৎৗড়ঢ়য়ৠৡৢৣ০১২৩৪৫৬৭৮৯ৰৱ৲৳৴৵৶৷৸৹৺৻';
final english = 'abcdefghijklmnopqrstuvwxyz';
final chinese = '安吧八爸百北不大岛的弟地东都对多儿二方港哥个关贵国过海好很会家见叫姐京九可老李零六吗妈么没美妹们名明哪那南你您朋七起千去人认日三上谁什生师十识是四他她台天湾万王我五西息系先香想小谢姓休学也一亿英友月再张这中字';

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