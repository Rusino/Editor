import 'package:editor/bug9850.dart';
import 'package:flutter/material.dart';

class Bug extends StatelessWidget {
  final Widget child;
  final String explanation = "";
  final double textScaleFactor;

  Bug({ Key key, String explanation, this.child, this.textScaleFactor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
      MediaQuery(
          data: MediaQueryData(textScaleFactor: textScaleFactor),
      child:
      Container(
          constraints: BoxConstraints(minHeight: size.height * textScaleFactor * textScaleFactor, minWidth: size.width * textScaleFactor),
          //width: size.width * textScaleFactor,
          //height: size.height * textScaleFactor,
          padding: EdgeInsets.all(30.0 / textScaleFactor),
          color: Colors.white,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Text(explanation),
                Expanded(child: Container(child: child, height: size.height * textScaleFactor * textScaleFactor)),
                FlatButton(
                    child: const Text('Back'),
                    key: Key('Back'),
                    onPressed: () => Navigator.of(context).pop()),
              ]
          )
      )
    );
  }
}

