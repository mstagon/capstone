import 'package:flutter/material.dart';

class Money with ChangeNotifier{
   int usermoney = 99999;

   void increase(int money){
      usermoney += money;
      notifyListeners();

   }

   void decrease(int money) {
      usermoney -= money;
      notifyListeners();

   }

}