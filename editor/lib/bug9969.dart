import 'package:flutter/material.dart';
import 'bug.dart';

class Bug9969 extends StatelessWidget {
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {

    controller = TextEditingController();

    final text = 'sff iii errty okkkkk ffgggvv bnnnnnnnn vvvvvv';
    final index = text.indexOf(' vvvvvv');
    controller.text = text;
    controller.selection = TextSelection(baseOffset: index, extentOffset: text.length);

    return Bug(
        child: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            controller: controller,
            enableInteractiveSelection: true,
            textAlign: TextAlign.justify,
            maxLines: 5,
          ),
        )
    ));
  }
}

