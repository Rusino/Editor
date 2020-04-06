import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'info.dart';

class Bugs extends StatefulWidget {
  Bugs({Key key, this.title, this.prefix}) : super(key: key);
  final String title;
  final String prefix;

  @override
  BugsState createState() => BugsState(prefix);
}

class BugsState extends State<Bugs> {

  final String prefix;
  BugsState(this.prefix);

  @override
  Widget build(BuildContext context) {

    final list = prefix == 'Bug'
                      ? buildList('Bug', kBugList)
                      : buildList('Stress', kStressList);
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
                child: CupertinoScrollbar(
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




