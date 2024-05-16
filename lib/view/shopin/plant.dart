import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/component/top_button.dart';
import '../../component/dialog.dart';
import '../../component/product_button.dart';
import '../../component/product_info.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({Key? key}) : super(key: key);

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {

  List<Map<String, dynamic>> plantInfoList = generatePlantInfoList();

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
                      index: index,
                      imagePath: plantInfo['imagePath'],
                      imageName: plantInfo['imageName'],
                      price: plantInfo['price'],
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
