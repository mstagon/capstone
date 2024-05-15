import 'package:capstone/const/color.dart';
import 'package:capstone/user/view/terrariumshop.dart';
import 'package:capstone/user/view/test.dart';
import 'package:capstone/view/home.dart';
import 'package:flutter/material.dart';
import '../user/view/setting.dart';
import '../user/view/treedisplay.dart';

class Rootscreen extends StatefulWidget {
  const Rootscreen({super.key});

  @override
  State<Rootscreen> createState() => _RootscreenState();
}

class _RootscreenState extends State<Rootscreen> with
    TickerProviderStateMixin{
  TabController? controller;

  @override
  void initState(){
    super.initState();

    controller = TabController(length: 3, vsync: this);
    controller!.addListener(tabListner);
  }

  tabListner(){
    setState(() {});
  }

  @override
  void dispose() {
    controller!.removeListener(tabListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children:
        renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      Home(),
      Test(),
      Setting()
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: controller!.index,
        onTap: (int index){
          setState(() {
            controller!.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(
              Icons.home//edgesensor_high_outlined
          ),label: "1"
          ),
          BottomNavigationBarItem( icon: Image.asset("asset/image/trsicon.png", width: 30, height: 30, color: secondaryColor),
              activeIcon: Image.asset("asset/image/trsicon.png", width: 30, height: 30, color: primaryColor),label: "2"
          ),
          BottomNavigationBarItem(icon: Icon(
              Icons.settings
          ),label: "3"
          )

        ]);
  }
}