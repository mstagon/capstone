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
      elevation: 10.0,
      backgroundColor: Colors.pink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('구매가 완료되었습니다.')));
                  Navigator.pop(context); // 다이얼로그 닫기
                } else {
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

Future<void> showPlantDetailDialog(BuildContext context, PlantDetailDialog dialog) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) => dialog,
  );
}
