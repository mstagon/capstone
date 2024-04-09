import 'package:flutter/material.dart';

class Tree extends StatefulWidget {
  const Tree({super.key});

  @override
  State<Tree> createState() => _TreeState();
}

class _TreeState extends State<Tree> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'asset/img/background.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 50.0,
          top: 100.0,
          child: SlideTransition(
            position: _offsetAnimation,
            child: Image.asset(
              'asset/img/character.jpeg',
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ],
    );
  }
}
