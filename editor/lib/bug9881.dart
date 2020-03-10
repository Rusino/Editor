import 'package:flutter/material.dart';
import 'bug.dart';

class Bug9881 extends StatelessWidget {

  Bug9881(this.textScaleFactor) { }
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Bug(
        textScaleFactor: textScaleFactor,
        child: Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Opacity(opacity: 0.8,
              child: Text(
                'ABCDE',
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 48.0, background: Paint()..color = Colors.red),
              ),
            )
        )
    ));
  }
}
