import 'dart:convert';
import 'package:capstone/user/view/test.dart';
import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/const/data.dart';
import 'package:dio/dio.dart';
import '../../component/custom_text_field.dart';
import '../../layout/default_layout.dart';
import '../../view/root.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {

    // final dio = Dio();
    // final emulatorIP = '10.0.2.2:3000';
    // final ip = emulatorIP;
    return DefaultLayout(
      backgroundColor: backgroundColor,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.0,),
                _subTitle(),
                Image.asset(
                  'asset/image/logo/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                CustomTextFormField(
                  hintText: "ID",
                  autofocus: true,
                  obscureText: false,
                  onChanged: (String value) {
                    username = value;
                  },
                ),
                SizedBox(height: 16.0,),
                CustomTextFormField(
                  hintText: "PW",
                  autofocus: true,
                  obscureText: true,
                  onChanged: (String value) {
                    password = value;
                  },
                ),
                SizedBox(height: 26.0,),
                ElevatedButton(
                    onPressed: () async {
                      final rawString = '$username:$password';
                      print(rawString);

                      Codec<String, String> stringToBase64 = utf8.fuse(base64);

                      String token = stringToBase64.encode(rawString); //base64로 인코딩

                      // final resp = await dio.post('http://$ip/auth/login',options: Options(
                      //     headers: {
                      //       'authorization' : 'Basic $token',
                      //     }
                      // )
                      // );
                      // final refreshToken = resp.data['refreshToken'];
                      // final accessToken = resp.data['accessToken'];

                      await storage.write(key:REFRESH_TOKEN_KEY, value:token);
                      await storage.write(key:ACCESS_TOKEN_KEY, value:token);

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Test())
                      );
                    },
                    style:  ElevatedButton.styleFrom(
                      foregroundColor: BODY_TEXT_COLOR,
                      backgroundColor: primaryColor,

                    ),
                    child: Text('로그인')),
                const SizedBox(height: 50),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterSocialButton(
                          onTap: () {
                          },
                          buttonType: ButtonType.facebook,
                          mini:
                          true // Button type for different type buttons
                      ),
                      // const SizedBox(width: 59.7,),
                      FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.google,
                          mini:
                          true // Button type for different type buttons
                      ),
                      // const SizedBox(width: 59.7,),
                      FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.apple,
                          mini:
                          true // Button type for different type buttons
                      ),
                    ]),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _subTitle extends StatelessWidget {
  const _subTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "로그인",
      style: TextStyle(fontSize: 26, color: Colors.black),
    );
  }
}