import 'package:flutter/material.dart';
import 'bug.dart';

class Bug9850 extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  Bug9850(this.textScaleFactor) { }
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {

    final text = 'ffi';
    controller.text = text;
    controller.selection = TextSelection(baseOffset: 1, extentOffset: 1);

    return Bug(
        explanation: "",
        textScaleFactor: textScaleFactor,
        child: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextFormField(
                key: Key('Bug9850'),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                controller: controller,
                enableInteractiveSelection: true,
                textAlign: TextAlign.justify,
                maxLines: 5,
              ),
            )
        )
    );
  }
}
