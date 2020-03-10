import 'package:flutter/material.dart';
import 'bug.dart';

class Bug9875 extends StatelessWidget {

  Bug9875(this.textScaleFactor) { }
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
                    'PESTO',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 48.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        letterSpacing: 3.0,
                        background: Paint()
                          ..color = Colors.red),
                  )
              )
          )
      )
    );
  }
}
