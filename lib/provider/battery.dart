import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import '../user/view/treedisplay.dart';

class BatteryProvider extends ChangeNotifier {
  final Battery _battery = Battery();
  BatteryState? _previousBatteryState;
  late StreamSubscription<BatteryState> _batteryStateSubscription;
  bool _isCharging = false;
  bool get isCharging => _isCharging;

  Future<void> detectCharging() async {
    _batteryStateSubscription = _battery.onBatteryStateChanged.listen((BatteryState state) {
      if (_previousBatteryState == null) {
        _previousBatteryState = state;
      } else if (_previousBatteryState != BatteryState.charging &&
          state == BatteryState.charging) {
        _isCharging = true;
        notifyListeners();
      } else if (_previousBatteryState == BatteryState.charging &&
          state != BatteryState.charging) {
        _isCharging = false;
        notifyListeners();
      }
      _previousBatteryState = state;
    });
  }


  void _cancelBatteryStateSubscription() {
    _batteryStateSubscription.pause();
  }


}
