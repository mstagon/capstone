import 'package:flutter/material.dart';

class Item with ChangeNotifier{
  String selecteditem = "";
  List buyitemname = [];

  void selected(String name){
    selecteditem = name;
    notifyListeners();

  }

  void additem(String name) {
    buyitemname.add(name);
    notifyListeners();

  }

}