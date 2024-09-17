import 'dart:ffi';

import 'package:capstone/splash/introduction_animation_screen.dart';
import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/const/data.dart';
import 'package:capstone/layout/default_layout.dart';
import 'package:capstone/view/root.dart';
import 'package:capstone/user/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checkToken();
    });

    // deleteToken();
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    if (refreshToken == null || accessToken == null) {
      Navigator.push(context, PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => IntroductionAnimationScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(seconds : 1),
      ));
    } else {
      Navigator.push(context, PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => IntroductionAnimationScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(seconds : 1),
      ));
    }
  }

  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: backgroundColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/image/logo/logo.png',
              width: MediaQuery.of(context).size.width ,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CircularProgressIndicator(
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }

}