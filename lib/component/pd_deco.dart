import 'package:capstone/component/list_deco.dart';
import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/component/dialogdeco.dart';

class PdDecobutton extends StatelessWidget {
  final String imagePath;
  final String imageName;
  final int price;
  final int index;

  PdDecobutton({required this.imagePath, required this.imageName, required this.price, required this.index});

  @override
  Widget build(BuildContext context) {
    // Fetch plant info from generatePlantInfoList
    List<Map<String, dynamic>> decoInfoList = generateDecoInfoList();
    final Map<String, dynamic> decoInfo = decoInfoList[index];

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () async {
        // Show dialog with the first plant info from the list
        showDecoDetailDialog(
          context,
          DecoDetailDialog(
            imagePath: decoInfoList[index]['imagePath'],
            imageName: decoInfoList[index]['imageName'],
            imageExplain: decoInfoList[index]['imageExplain'],
            price: decoInfoList[index]['price'],
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
                width: 100,
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