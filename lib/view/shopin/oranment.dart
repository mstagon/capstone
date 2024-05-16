import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/component/top_button.dart';
import '../../component/product_button.dart';

class OrnamentPage extends StatefulWidget {
  const OrnamentPage({Key? key}) : super(key: key);

  @override
  State<OrnamentPage> createState() => _OrnamentPageState();
}

class _OrnamentPageState extends State<OrnamentPage> {
  final List<Map<String, dynamic>> plantInfoList = [
    {
      'imagePath': 'asset/image/ornament.png',
      'imageName': '장식 1',
      'imageExplain': '설명',

    },
    {
      'imagePath': 'asset/image/ornament.png',
      'imageName': '장식 2',
      'imageExplain': '설명',
    },
    {
      'imagePath': 'asset/image/ornament.png',
      'imageName': '장식 2',
      'imageExplain': '설명',
    },
    {
      'imagePath': 'asset/image/ornament.png',
      'imageName': '장식 2',
      'imageExplain': '설명',
    },
    {
      'imagePath': 'asset/image/ornament.png',
      'imageName': '장식 2',
      'imageExplain': '설명',
    },
    {
      'imagePath': 'asset/image/ornament.png',
      'imageName': '장식 2',
      'imageExplain': '설명',
    },

    {
      'imagePath': 'asset/image/ornament.png',
      'imageName': '장식 2',
      'imageExplain': '설명',
    },
  ];

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
                "식물 상점",
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
              itemCount: plantInfoList.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> plantInfo = plantInfoList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Pdbutton(
                      imagePath: plantInfo['imagePath'],
                      imageName: plantInfo['imageName'],
                      // imageExplain: plantInfo['imageExplain'],
                      price: 100, index: index,
                      // pagePath: (OrnamentPage()),
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
