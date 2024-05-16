import 'package:capstone/const/color.dart';
import 'package:capstone/view/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capstone/provider/money.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Topbutton extends StatefulWidget {
  @override
  State<Topbutton> createState() => _TopbuttonState();
}

class _TopbuttonState extends State<Topbutton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _money = Provider.of<Money>(context, listen: false).usermoney;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        height: 58,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context); // 뒤로가기 버튼을 눌렀을 때 이전 화면으로 이동
                },
                icon: Icon(Icons.arrow_back), // 뒤로가기 버튼
              ),
              Column(
                children: [
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      Image.asset(height: 40,"asset/image/icon/point.png"),
                      Consumer<Money>(
                        builder: (context, moneyProvider, _) {
                          return Positioned(
                              top: MediaQuery.of(context).size.height * 0.012,
                              left: MediaQuery.of(context).size.height * 0.04,
                              child: Text(
                                '$_money',
                                style: TextStyle(fontSize: 16, color: ACCENT_TEXT_COLOR),
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
