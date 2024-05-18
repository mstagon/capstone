import 'package:capstone/component/list_deco.dart';
import 'package:capstone/component/pd_deco.dart';
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
  List<Map<String, dynamic>> decoInfoList = generateDecoInfoList();

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
                "장식상점",
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
              itemCount: decoInfoList.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> decoInfo = decoInfoList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: PdDecobutton(
                      index: index,
                      imagePath: decoInfo['imagePath'],
                      imageName: decoInfo['imageName'],
                      price: decoInfo['price'],
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
