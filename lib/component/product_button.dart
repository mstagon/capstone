import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';

class Pdbutton extends StatelessWidget {
  final String imagePath;
  final String imageName;
  final String imageExplain;
  final dynamic pagePath;

  Pdbutton({required this.imagePath, required this.imageName, required this.pagePath, required this.imageExplain});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pagePath),
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
                SizedBox(height: 4.0),
                Text(
                  imageExplain,
                  style: TextStyle(
                    fontSize: 16,
                    color: fontColor.withOpacity(0.7),
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
