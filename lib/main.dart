import 'package:battery_plus/battery_plus.dart';
import 'package:capstone/provider/battery.dart';
import 'package:capstone/provider/nfc.dart';
import 'package:capstone/splash/introduction_animation_screen.dart';
import 'package:capstone/user/view/treedisplay.dart';
import 'package:capstone/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:capstone/view/root.dart';
import 'package:capstone/const/color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BatteryProvider()),
          ChangeNotifierProvider(create: (_) => NFCProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: backgroundColor,

              ),
              scaffoldBackgroundColor: Colors.white,
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
          home : IntroductionAnimationScreen(),
        ),
      ),
  );
}