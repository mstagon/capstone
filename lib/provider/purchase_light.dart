import 'package:flutter/material.dart';

class PurchasedLight {
  final String imageName;
  final String imagePath;

  PurchasedLight({required this.imageName, required this.imagePath});
}

class PurchasePLight with ChangeNotifier {
  List<PurchasedLight> _purchasedItems = [];

  List<PurchasedLight> get purchasedLight => _purchasedItems;

  void addPurchasedItem(PurchasedLight item) {
    _purchasedItems.add(item);
    notifyListeners();
  }
}
