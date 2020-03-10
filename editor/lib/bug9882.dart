import 'package:flutter/material.dart';
import 'bug.dart';

class Bug9882 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Bug(
        child: Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: RichText(
              text: TextSpan(
                text: 'aaaa bbbb ',
                style: TextStyle(fontSize: 48.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'cc dd',
                      style:TextStyle(fontFamily: 'serif', fontSize: 64.0)),
                ],
              ),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
            )
        )
    ));
  }
}
