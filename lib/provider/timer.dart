import 'dart:async';

import 'package:flutter/material.dart';


class TimerModel extends ChangeNotifier {
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  Timer? _timer;

  int get hours => _hours;
  int get minutes => _minutes;
  int get seconds => _seconds;

  bool get isRunning => _timer != null && _timer!.isActive;

  void startTimer() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        _seconds++;
        if (_seconds == 60) {
          _seconds = 0;
          _minutes++;
        }
        if (_minutes == 60) {
          _minutes = 0;
          _hours++;
        }
        notifyListeners();
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
    notifyListeners();
  }

  void resetTimer() {
    _hours = 0;
    _minutes = 0;
    _seconds = 0;
    notifyListeners();
  }
}