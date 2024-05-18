import 'package:capstone/component/list_deco.dart';
import 'package:capstone/component/list_light.dart';
import 'package:capstone/component/pd_deco.dart';
import 'package:capstone/component/pd_light.dart';
import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/component/top_button.dart';

class LightPage extends StatefulWidget {
  const LightPage({Key? key}) : super(key: key);

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  List<Map<String, dynamic>> lightInfoList = generateLightInfoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Topbutton(),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "조명상점",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: lightInfoList.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> lightInfo = lightInfoList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: PdLightbutton(
                      index: index,
                      imagePath: lightInfo['imagePath'],
                      imageName: lightInfo['imageName'],
                      price: lightInfo['price'],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
