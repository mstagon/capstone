import 'package:flutter/material.dart';

class PurchasedDeco {
  final String imageName;
  final String imagePath;

  PurchasedDeco({required this.imageName, required this.imagePath});
}

class PurchasePDeco with ChangeNotifier {
  List<PurchasedDeco> _purchasedItems = [];

  List<PurchasedDeco> get purchasedDeco => _purchasedItems;

  void addPurchasedItem(PurchasedDeco item) {
    _purchasedItems.add(item);
    notifyListeners();
  }
}
