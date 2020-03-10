import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import "themes.dart";
import 'bug9850.dart';
import 'bug9851.dart';
import 'bug9875.dart';
import 'bug9881.dart';
import 'bug9882.dart';
import 'bug9968.dart';
import 'bug9969.dart';
import 'bug9970.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp() { }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('MaterialApp'),
      theme: kLightGalleryTheme,
      title: 'Test Bugs',
      home: MyAppPage(title: 'Text Editor Tests Home Page'),
      routes : {
        'Bug9850': (BuildContext context) => Bug9850(),
        'Bug9851': (BuildContext context) => Bug9851(),
        'Bug9875': (BuildContext context) => Bug9875(),
        'Bug9881': (BuildContext context) => Bug9881(),
        'Bug9882': (BuildContext context) => Bug9882(),
        'Bug9968': (BuildContext context) => Bug9968(),
        'Bug9969': (BuildContext context) => Bug9969(),
        'Bug9970': (BuildContext context) => Bug9970(),
      },
    );
  }
}

class MyAppPage extends StatefulWidget {
  MyAppPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  MyAppPageState createState() => MyAppPageState();
}

class MyAppPageState extends State<MyAppPage> {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return
      MediaQuery(
      data: MediaQueryData(),
      child: Container(
        key: Key('Container'),
        constraints: BoxConstraints(minHeight: size.height , minWidth: size.width),
        //width: size.width * textScaleFactor,
        //height: size.height * textScaleFactor,
        padding: EdgeInsets.all(30.0),
        color: Colors.white,
        child: Column(
          key: Key('Column'),
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Expanded(child: Container(constraints: BoxConstraints(minHeight: size.height))),
          ],
        ),
      ),
    );
  }
}

