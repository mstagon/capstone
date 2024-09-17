 import 'dart:async';
import 'dart:ui';

import 'package:battery_plus/battery_plus.dart';
import 'package:capstone/provider/battery.dart';
import 'package:capstone/provider/money.dart';
import 'package:capstone/provider/nfc.dart';
import 'package:capstone/provider/purchase_deco.dart';
import 'package:capstone/provider/purchase_light.dart';
import 'package:capstone/provider/purchase_provider.dart';
import 'package:capstone/provider/timer.dart';
import 'package:capstone/splash/introduction_animation_screen.dart';
import 'package:capstone/user/view/login_screen.dart';
import 'package:capstone/user/view/test.dart';
import 'package:capstone/user/view/treedisplay.dart';
import 'package:capstone/view/home.dart';
import 'package:capstone/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:capstone/view/root.dart';
import 'package:capstone/const/color.dart';
import 'package:provider/provider.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

Future<void> main() async {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NFCProvider()),
          ChangeNotifierProvider(create: (_) => Money()),
          ChangeNotifierProvider(create: (_) => TimerProvider()),
          ChangeNotifierProvider(create: (_) => PurchaseProvider()),
          ChangeNotifierProvider(create: (_) => PurchasePDeco()),
          ChangeNotifierProvider(create: (_) => PurchasePLight())

        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: "HancomMalangMalang-Bold",
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

/*
Future<void> initalizeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,//ios의 경우 백그라운드시의 function 이 별개로 되어있다.
    ),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,//false 시 백그라운드모드
      autoStart: true,//초기화 시 자동 시작
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) { // 서비스의 백그라운드/포그라운드가 변경되었을경우
    service.on('setAsForeground').listen((event) {
      service.setAsBackgroundService();
    });
    service.on('setAsBackground').listen((
        event) { // 서비스의 백그라운드/포그라운드가 변경되었을경우
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(
      const Duration(seconds: 1), (timer) async { //매 초 백그라운드 서비스를 실행한다.
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) { // foregroundservice의 경우
        flutterLocalNotificationsPlugin.show(
          notificationId,
          'Service',
          'Awesome ${DateTime.now()}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              notificationChannelId,
              'MY FOREGROUND SERVICE',
              icon: 'ic_bg_service_small',
              ongoing: true,
            ),
          ),
        );
      }
      // 이 이후의 경우는 사용자가 인지하지 못하는 백그라운드 function들이 실행된다.
      print("Background");
      service.invoke('update');
    }
  });
}
*/


