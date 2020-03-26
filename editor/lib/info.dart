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
import 'bug10075.dart';
import "stress.dart";
import 'bengali.dart';

class Info {
  Info(this.name, this.builder);
  final String name;
  final WidgetBuilder builder;
}

List<WidgetBuilder> buildList(String prefix, List<Info> list) {
  return List<WidgetBuilder>.generate(list.length, (int index) {
        final bug = list[index];
        return (BuildContext context) =>
               FlatButton(
                  child: Text('$prefix #${bug.name}'),
                  key: Key('$prefix${bug.name}'),
                  onPressed: () => Navigator.pushNamed(context, '$prefix${bug.name}')
              );
  });
}

Map<String, WidgetBuilder> buildRoutes() {

  Map<String, WidgetBuilder> result = <String, WidgetBuilder>{};
  result.addAll(<String, WidgetBuilder>{
    for (final bug in kBugList) 'Bug${bug.name}': bug.builder,
  });
  result.addAll(<String, WidgetBuilder>{
    for (final bug in kStressList) 'Stress${bug.name}': bug.builder,
  });
  result.addAll({
    'AllBugs': (BuildContext context) => Bugs(),
    'AllStress': (BuildContext context) => Stress(),
  });

  return result;
}

final List<Info> kBugList = <Info>[
  Info('9850', (BuildContext context) => Bug9850()),
  Info('9851', (BuildContext context) => Bug9851()),
  Info('9875', (BuildContext context) => Bug9875()),
  Info('9881', (BuildContext context) => Bug9881()),
  Info('9882', (BuildContext context) => Bug9882()),
  Info('9968', (BuildContext context) => Bug9968()),
  Info('9970', (BuildContext context) => Bug9970()),
  Info('10049', (BuildContext context) => Bug10049()),
  Info('10050', (BuildContext context) => Bug10050()),
  Info('10075', (BuildContext context) => Bug10075()),
];

final List<Info> kStressList = <Info>[
  Info('Bengali', (BuildContext context) => Bengali()),
];



