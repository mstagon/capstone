import 'package:capstone/provider/purchase_light.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/color.dart';

class PurchasedLightDialog extends StatelessWidget {
  final Function(String) onItemSelected;

  PurchasedLightDialog({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final purchasePLight = Provider.of<PurchasePLight>(context);
    final purchasedLight = purchasePLight.purchasedLight;

    return Dialog(
      elevation: 10.0,
      backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Container(
        width: 300, // 다이얼로그의 고정 너비 설정
        height: 300, // 다이얼로그의 고정 높이 설정
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: purchasedLight.isEmpty
              ? Center(
            child: Text(
              '구매한 조명 아이템이 없습니다.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          )
              : GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3개의 열
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: purchasedLight.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onItemSelected(purchasedLight[index].imagePath);
                  Navigator.pop(context); // 다이얼로그 닫기
                },
                child: Image.asset(
                  purchasedLight[index].imagePath,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}