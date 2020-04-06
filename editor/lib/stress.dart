import 'dart:async';

import 'package:editor/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'bug.dart';

class Stress extends Bug {
    Stress({ String explanation, Widget child}) : super(key: 'Stress', explanation: explanation, child: child);
}





