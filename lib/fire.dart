import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

class FireflyAnimation extends StatefulWidget {
  @override
  _FireflyAnimationState createState() => _FireflyAnimationState();
}

class _FireflyAnimationState extends State<FireflyAnimation> {
  List<Firefly> _fireflies = [];
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _initializeFireflies();
    _startAnimation();
  }

  void _initializeFireflies() {
    for (int i = 0; i < 10; i++) {
      double dx = _random.nextDouble();
      double dy = _random.nextDouble();
      _fireflies.add(Firefly(dx, dy));
    }
  }

  void _startAnimation() {
    Timer.periodic(Duration(milliseconds: 70), (timer) {
      _updateFireflies();
    });
  }

  void _updateFireflies() {
    setState(() {
      for (int i = 0; i < _fireflies.length; i++) {
        _fireflies[i].updatePosition();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var firefly in _fireflies)
          Positioned(
            left: firefly.dx * MediaQuery.of(context).size.width,
            top: firefly.dy * MediaQuery.of(context).size.height,

            child: NeonPoint(
              pointSize: 2,
              pointColor: Colors.yellow.shade50,
              spreadColor: Colors.greenAccent,
              lightSpreadRadius: 20,
            ),
          ),
      ],
    );
  }
}

class Firefly {
  late double dx;
  late double dy;
  late double speedX;
  late double speedY;
  final Random _random = Random();

  Firefly(double initialX, double initialY) {
    dx = initialX;
    dy = initialY;
    speedX = (_random.nextDouble() * 0.01) - 0.005;
    speedY = (_random.nextDouble() * 0.01) - 0.005; // 음수 값을 추가하여 위로 솟아오르는 효과 추가
  }

  void updatePosition() {
    dx = (dx + speedX) % 1.0;
    dy = (dy + speedY) % 1.0;
  }
}