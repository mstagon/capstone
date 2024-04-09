import 'package:capstone/view/home.dart';
import 'package:flutter/material.dart';
import 'package:capstone/user/view/treedisplay.dart';
import '../user/view/setting.dart';

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

    controller = TabController(length: 2, vsync: this);
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
      // Tree(),
      Setting()
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
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
          // BottomNavigationBarItem(icon: Icon(
          //     Icons.gamepad//edgesensor_high_outlined
          // ),label: "2"
          //),
          BottomNavigationBarItem(icon: Icon(
              Icons.settings
          ),label: "3"
          )

        ]);
  }
}