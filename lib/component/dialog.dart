import 'package:flutter/material.dart';
import 'package:capstone/provider/money.dart';
import 'package:provider/provider.dart';

class PlantDetailDialog extends StatelessWidget {
  final List<String> imagePaths;
  final String imageName;
  final String imageExplain;
  final int price;

  PlantDetailDialog({
    required this.imagePaths,
    required this.imageName,
    required this.imageExplain,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imagePaths[index],
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                imageName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '가격: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                imageExplain,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final moneyProvider = Provider.of<Money>(context, listen: false);
                if (moneyProvider.usermoney >= price) {
                  moneyProvider.decrease(price);
                  // 여기에 구매 완료 메시지 또는 다른 작업을 수행할 수 있습니다.
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('구매가 완료되었습니다.')));
                  Navigator.pop(context); // 다이얼로그 닫기
                } else {
                  // 사용자의 돈이 부족할 때의 처리
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('잔액이 부족합니다.')));
                }
              },
              child: Text('구매하기'),
            ),
          ],
        ),
      ),
    );
  }
}
