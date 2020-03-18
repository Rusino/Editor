import 'package:flutter/material.dart';

class Stress extends StatefulWidget {
  Stress({Key key, this.title}) : super(key: key);
  final String title;
  @override
  StressState createState() => StressState();
}

class StressState extends State<Stress> {

  @override
  Widget build(BuildContext context) {

    return
      MediaQuery(
        data: MediaQueryData(),
        child: Container(
          key: Key('Container'),
          padding: EdgeInsets.all(30.0),
          color: Colors.white,
          child: Column(
            key: Key('Column'),
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // TODO: transform into a list
            children: <Widget>[
              FlatButton(child: Text('Bengali'), key: Key('StressBengali'),
                  onPressed: () => { Navigator.pushNamed(context, 'StressBengali')}),
              Expanded(child: Container()),
              FlatButton(
                  child: const Text('Back'),
                  key: Key('Back'),
                  onPressed: () => Navigator.of(context).pop())
            ],
          ),
        ),
      );
  }
}




