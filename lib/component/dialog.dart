import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:capstone/provider/money.dart';
import '../provider/purchase_provider.dart';

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
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        imageName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '가격: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            '$price',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        imageExplain,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final moneyProvider = Provider.of<Money>(context, listen: false);
                        if (moneyProvider.usermoney >= price) {
                          moneyProvider.decrease(price);
                          final purchaseProvider = Provider.of<PurchaseProvider>(context, listen: false);
                          purchaseProvider.addPurchasedItem(PurchasedItem(
                              imageName: imageName,
                              imagePath: imagePaths[0])); // Add the first image as the item image
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('구매가 완료되었습니다.')));
                          Navigator.pop(context); // Close the dialog
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('잔액이 부족합니다.')));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        '구매하기',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
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
