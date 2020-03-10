import 'package:editor/bug9850.dart';
import 'package:flutter/material.dart';

class Bug extends StatelessWidget {
  final Widget child;
  final String explanation = "";

  Bug({ Key key, String explanation, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
      Container(
          constraints: BoxConstraints(minHeight: size.height, minWidth: size.width),
          //width: size.width * textScaleFactor,
          //height: size.height * textScaleFactor,
          padding: EdgeInsets.all(30.0),
          color: Colors.white,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Text(explanation),
                Expanded(child: Container(child: child, height: size.height)),
                FlatButton(
                    child: const Text('Back'),
                    key: Key('Back'),
                    onPressed: () => Navigator.of(context).pop()),
              ]
          )
    );
  }
}

