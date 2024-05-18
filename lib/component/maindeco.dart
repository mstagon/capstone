import 'package:capstone/provider/purchase_deco.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PurchasedDecoDialog extends StatelessWidget {
  final Function(String) onItemSelected;

  PurchasedDecoDialog({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final purchasePdeco = Provider.of<PurchasePDeco>(context);
    final purchasedDeco = purchasePdeco.purchasedDeco;

    return Dialog(
      elevation: 10.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Container(
        width: 300, // 다이얼로그의 고정 너비 설정
        height: 300, // 다이얼로그의 고정 높이 설정
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: purchasedDeco.isEmpty
              ? Center(
            child: Text(
              '구매한 아이템이 없습니다.',
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
            itemCount: purchasedDeco.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onItemSelected(purchasedDeco[index].imagePath);
                  Navigator.pop(context); // 다이얼로그 닫기
                },
                child: Image.asset(
                  purchasedDeco[index].imagePath,
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