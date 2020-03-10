import 'package:flutter/material.dart';
import 'bug.dart';

class Bug9851 extends StatelessWidget {

  Bug9851(this.textScaleFactor) { }
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {

    return Bug(
        textScaleFactor: textScaleFactor,
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
}