import 'package:flutter/material.dart';
import 'bug.dart';

class Bug9968 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Bug(
        child: Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Text('AAAAA \u{1f600} BBBBB CCCCC DDDDD EEEEE',
              style: TextStyle(fontSize: 36.0),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
            )
        )
    ));
  }
}

