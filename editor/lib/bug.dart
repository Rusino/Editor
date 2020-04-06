import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';

// TODO: make it stateful
class Bug extends StatelessWidget {
  final Widget child;
  final String explanation;
  final Function generateText;
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode(canRequestFocus: true);
  final Duration delay = const Duration(milliseconds: 1000);

  bool finished;
  Timer timeoutTimer;
  Ticker ticker;

  Bug({ String key: 'Bug', this.explanation, this.child, this.generateText})
      : super(key: Key(key)) {
      ticker = null;
      finished = true;
      timeoutTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
          padding: EdgeInsets.all(30.0),
          color: Colors.white,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RepaintBoundary(
                  key: Key('RepaintBoundary'),
                  child: child,
                ),
                Expanded(child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(explanation,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black54,
                          fontSize: 10,
                          decoration: TextDecoration.none)
                    )
                )),
                FlatButton(
                    child: Text('Refresh'),
                    key: Key('Refresh'),
                    onPressed: () => { controller.text = this.generateText() }
                    ),
                FlatButton(
                    child: const Text('Back'),
                    key: Key('Back'),
                    onPressed: () => Navigator.of(context).pop()),
              ]
          )
    );
  }

  @protected
  Future<bool> test(WidgetTester tester) async {
      return false;
  }

  @protected
  void update(Duration duration) {
    controller.text = this.generateText();
  }

  void startTesting() {
    timeoutTimer = Timer.periodic(const Duration(minutes: 1), stopTesting);
    finished = false;
  }

  void stopTesting(Timer timer) {
    finished = true;
  }
}




