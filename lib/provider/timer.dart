import 'dart:async';
import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;
  int _plantsIndex = 1;

  int get seconds => _seconds;
  bool get isRunning => _isRunning;
  int get plantsIndex => _plantsIndex;

  String get formattedTime {
    final hours = (_seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((_seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  void startTimer() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds++;
      // Increment the plants index based on elapsed time (every 10 seconds for example)
      if (_seconds % 10 == 0) {
        _plantsIndex++;
      }
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _isRunning = false;
    _seconds = 0;
    _plantsIndex = 1; // Reset the plants index when the timer stops
    notifyListeners();
  }

  void resetTimer() {
    _timer?.cancel();
    _seconds = 0;
    _isRunning = false;
    _plantsIndex = 1; // Reset the plants index when the timer resets
    notifyListeners();
  }
}
