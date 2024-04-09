import 'package:capstone/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:capstone/view/root.dart';
import 'package:capstone/const/color.dart';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            sliderTheme: SliderThemeData(
                thumbColor: primaryColor,
                activeTickMarkColor: primaryColor,
                inactiveTickMarkColor: primaryColor.withOpacity(0.3)
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: primaryColor,
              unselectedItemColor: secondaryColor,
              backgroundColor: backgroundColor,
            )
        ),
        home : Rootscreen(),
      )
  );
}