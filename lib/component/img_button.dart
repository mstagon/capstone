import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';

class Imgbutton extends StatelessWidget {
  final String imagePath;
  final String imageName;
  final dynamic pagePath;

  Imgbutton({required this.imagePath, required this.imageName, required this.pagePath});

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(imagePath),
          ),
          SizedBox(width: 8.0),
          Container(
            child: Text(
              imageName,
              style: TextStyle(
                fontSize: 20,
                color: fontColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
