import 'package:capstone/provider/battery.dart';
import 'package:capstone/provider/nfc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view/fire.dart';

class Tree extends StatefulWidget {
  const Tree({super.key});

  @override
  State<Tree> createState() => _TreeState();
}

class _TreeState extends State<Tree> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late BatteryProvider _batteryProvider;

  get random => null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, 0.05),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat(reverse: true);
    _batteryProvider = Provider.of<BatteryProvider>(context, listen: false);
    _batteryProvider.detectCharging();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return PopScope(
          canPop: true ,
          onPopInvoked: (bool didPop) {
            Provider.of<NFCProvider>(context, listen: false).detectNFC();
            Provider.of<BatteryProvider>(context, listen: false).detectCharging();
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'asset/img/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SlideTransition(
                    position: _offsetAnimation,
                    child: Image.asset(
                      'asset/img/character.png',
                      width: 500.0,
                      height: 500.0,
                    ),
                  ),
                  SizedBox(height: 70,)
                ],
              ),
              FireflyAnimation(),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Container(
                  height: 58,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SlideTransition(
                        //   position: _backAnimation,
                        //   child:
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                          //   ),
                        ),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.light),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

}
