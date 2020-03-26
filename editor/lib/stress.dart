import 'package:editor/info.dart';
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

    final list = buildList('Stress', kStressList);
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
            children: <Widget>[
              Expanded(
                  child: Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8.0),
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int position) => list[position](context),
                      )
                  )
              ),
              FlatButton(
                  child: const Text('Back'),
                  key: Key('Back'),
                  onPressed: () => Navigator.pop(context))
            ],
          ),
        ),
      );
  }
}




