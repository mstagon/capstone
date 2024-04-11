import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/const/data.dart';
import 'package:dio/dio.dart';
import '../../component/custom_text_field.dart';
import '../../layout/default_layout.dart';
import '../../view/root.dart';

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
                _Title(),
                SizedBox(height: 16.0,),
                _subTitle(),
                Image.asset(
                  'asset/img/character.png',
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
                SizedBox(height: 16.0,),
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
                          MaterialPageRoute(builder: (_) => Rootscreen())
                      );
                    },
                    style:  ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: Text('로그인')),
                TextButton(
                    onPressed: () async {
                      // final refreshToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTcwNjI1NzUyOCwiZXhwIjoxNzA2MzQzOTI4fQ.ZEpBqXXQCtlTsdgJ-iAbVxgRrtE8KE5LyGbN1y96uKY';
                      // final resp = await dio.post('http://$ip/auth/token',options: Options(
                      //     headers: {
                      //       'authorization' : 'Bearer $refreshToken',
                      //     }
                      // )
                      // );
                      // print(resp.data);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: Text('회원가입'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Digital Terrarium",
      style: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}

class _subTitle extends StatelessWidget {
  const _subTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Login",
      style: TextStyle(fontSize: 16, color: BODY_TEXT_COLOR),
    );
  }
}