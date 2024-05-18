import 'package:flutter/material.dart';

class PurchasedItem {
  final String imageName;
  final String imagePath;

  PurchasedItem({required this.imageName, required this.imagePath});
}

class PurchaseProvider with ChangeNotifier {
  List<PurchasedItem> _purchasedItems = [];

  List<PurchasedItem> get purchasedItems => _purchasedItems;

  void addPurchasedItem(PurchasedItem item) {
    _purchasedItems.add(item);
    notifyListeners();
  }
}
