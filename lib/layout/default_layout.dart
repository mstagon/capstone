import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  const DefaultLayout({super.key, required this.child,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: child
    );
  }
}