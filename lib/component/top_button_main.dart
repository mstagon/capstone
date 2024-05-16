import 'package:capstone/const/color.dart';
import 'package:capstone/view/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capstone/provider/money.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Topbutton_main extends StatefulWidget {
  @override
  State<Topbutton_main> createState() => _Topbutton_mainState();
}

class _Topbutton_mainState extends State<Topbutton_main> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        height: 58,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                              '${moneyProvider.usermoney}',
                              style: TextStyle(fontSize: 16, color: ACCENT_TEXT_COLOR),
                            ),
                          );
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
