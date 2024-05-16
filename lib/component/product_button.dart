import 'package:capstone/component/product_info.dart';
import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/component/dialog.dart';

class Pdbutton extends StatelessWidget {
  final String imagePath;
  final String imageName;
  final int price;
  final int index;

  Pdbutton({required this.imagePath, required this.imageName, required this.price, required this.index});

  @override
  Widget build(BuildContext context) {
    // Fetch plant info from generatePlantInfoList
    List<Map<String, dynamic>> plantInfoList = generatePlantInfoList();
    final Map<String, dynamic> plantInfo = plantInfoList[index];

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () async {
        // Show dialog with the first plant info from the list
        showPlantDetailDialog(
          context,
          PlantDetailDialog(
            imagePaths: plantInfoList[index]['imagePaths'],
            imageName: plantInfoList[index]['imageName'],
            imageExplain: plantInfoList[index]['imageExplain'],
            price: plantInfoList[index]['price'],
          ),
        );
      },
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                height: 80,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  imageName,
                  style: TextStyle(
                    fontSize: 20,
                    color: fontColor,
                  ),
                ),
                SizedBox(height: 4.0,),
                Text(
                  '가격: ' + price.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: fontColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
