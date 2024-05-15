import 'package:flutter/material.dart';

import '../../const/color.dart';

class Trsetting extends StatefulWidget {
  const Trsetting({super.key});

  @override
  State<Trsetting> createState() => _TrsettingState();
}

class _TrsettingState extends State<Trsetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text("Trsetting page"
          ,style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
