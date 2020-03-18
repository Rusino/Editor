import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import "themes.dart";
import "bugs.dart";
import 'bug9850.dart';
import 'bug9851.dart';
import 'bug9875.dart';
import 'bug9881.dart';
import 'bug9882.dart';
import 'bug9968.dart';
import 'bug9969.dart';
import 'bug9970.dart';
import 'bug10049.dart';
import 'bug10050.dart';
import "stress.dart";
import 'bengali.dart';

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
        'AllBugs': (BuildContext context) => Bugs(),
        'Bug9850': (BuildContext context) => Bug9850(),
        'Bug9851': (BuildContext context) => Bug9851(),
        'Bug9875': (BuildContext context) => Bug9875(),
        'Bug9881': (BuildContext context) => Bug9881(),
        'Bug9882': (BuildContext context) => Bug9882(),
        'Bug9968': (BuildContext context) => Bug9968(),
        'Bug9969': (BuildContext context) => Bug9969(),
        'Bug9970': (BuildContext context) => Bug9970(),
        //'Bug10049': (BuildContext context) => Bug10049(),
        'Bug10050': (BuildContext context) => Bug10050(),
        'AllStress': (BuildContext context) => Stress(),
        'StressBengali': (BuildContext context) => Bengali(),
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
            FlatButton(child: Text('Bugs'), key: Key('Bugs'),
                onPressed: () => { Navigator.pushNamed(context, 'AllBugs')}),
            FlatButton(child: Text('Stress'), key: Key('Stress'),
                onPressed: () => { Navigator.pushNamed(context, 'AllStress')}),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

