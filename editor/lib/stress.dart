import 'dart:async';

import 'package:editor/info.dart';
import 'package:flutter/material.dart';
import 'bug.dart';

class Stress extends Bug {
    Stress({ String explanation, Widget child})
        : super(key: 'Stress', explanation: explanation, child: child);
    bool finished;
    Timer timeoutTimer;

    void startTesting() {
      timeoutTimer = Timer.periodic(const Duration(minutes: 1), stopTesting);
      finished = false;
    }

    void stopTesting(Timer timer) {
        finished = true;
    }
}





