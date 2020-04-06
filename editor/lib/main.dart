import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import "themes.dart";
import "info.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('MaterialApp'),
      theme: kLightGalleryTheme,
      title: 'Test Text Editing Functionality',
      home: MyAppPage(title: 'Text Editor Tests Home Page'),
      routes : buildRoutes()
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

