import 'package:flutter/material.dart';
import 'bug.dart';

class Bug9970 extends StatelessWidget {

  Bug9970(this.textScaleFactor) { }
  final double textScaleFactor;


  @override
  Widget build(BuildContext context) {

    return Bug(
        textScaleFactor: textScaleFactor,
        child: Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: RichText(
              textDirection: TextDirection.ltr,
              text: TextSpan(
                  text: '\u904d  ',
                  style: TextStyle(
                      fontFamily: 'locltest',
                      fontSize: 48.0,
                      color: Colors.black,
                      locale: Locale('ko')),
                  children: <TextSpan>[
                    TextSpan(text: '\u904d',
                        style: TextStyle(locale: new Locale('zh', 'HK'))),
                  ]
              ),
            )
        )
    ));
  }
}



