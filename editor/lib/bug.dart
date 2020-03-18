import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class Bug extends StatelessWidget {
  final Widget child;
  final String explanation;
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode(canRequestFocus: true);
  final Duration delay = const Duration(milliseconds: 3000);

  Bug({ Key key, this.explanation, this.child}) : super(key: Key('Bug'));

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
}




