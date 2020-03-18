import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class Bugs extends StatefulWidget {
  Bugs({Key key, this.title}) : super(key: key);
  final String title;

  @override
  BugsState createState() => BugsState();
}

class BugsState extends State<Bugs> {

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
              FlatButton(child: Text('Bug #9850'), key: Key('Bug9850'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug9850')}),
              FlatButton(child: Text('Bug #9851'), key: Key('Bug9851'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug9851')}),
              FlatButton(child: Text('Bug #9875'), key: Key('Bug9875'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug9875')}),
              FlatButton(child: Text('Bug #9881'), key: Key('Bug9881'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug9881')}),
              FlatButton(child: Text('Bug #9882'), key: Key('Bug9882'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug9882')}),
              FlatButton(child: Text('Bug #9968'), key: Key('Bug9968'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug9968')}),
              FlatButton(child: Text('Bug #9969'), key: Key('Bug9969'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug9969')}),
              FlatButton(child: Text('Bug #9970'), key: Key('Bug9970'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug9970')}),
              FlatButton(child: Text('Bug #10049'), key: Key('Bug10049'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug10049')}),
              FlatButton(child: Text('Bug #10050'), key: Key('Bug10050'),
                  onPressed: () => { Navigator.pushNamed(context, 'Bug10050')}),
              Expanded(child: Container()),
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




