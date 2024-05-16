import 'package:capstone/component/top_button.dart';
import 'package:capstone/component/top_button_main.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/provider/timer.dart';
import 'package:capstone/view/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/nfc.dart';
import '../../view/fire.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String imagePath = 'asset/image/plants/default.png';
  String tx = "성장중 . . .";
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 200.0, end: 210.0).animate(_controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _nfcProvider = Provider.of<NFCProvider>(context);
    _nfcProvider.detectNFC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Consumer<NFCProvider>(
          builder: (context, nfcProvider, _) {
            final _timerProvider = Provider.of<TimerProvider>(context, listen: false);
            if (nfcProvider.isNFCDetected) {
              imagePath = 'asset/image/plants/a3.png';
              tx = "성장중 . . .";
              isVisible = true;
              if (!_timerProvider.isRunning) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _timerProvider.startTimer();
                });
              }
            } else {
              imagePath = 'asset/image/plants/default.png';
              tx = "식물이 자고 있습니다. \n 테리리움에 핸드폰을 \n넣어 식물을 깨워주세요.";
              isVisible = false;
              if (_timerProvider.isRunning) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _timerProvider.stopTimer();
                });
              }
            }
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        imagePath = 'asset/image/plants/a3.png';
                        tx = "성장중 . . .";
                        isVisible = true;
                        if (!_timerProvider.isRunning) {
                          _timerProvider.startTimer();
                        }
                      },
                      child: Text("a"),
                    ),
                    SizedBox(height: 100),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget? child) {
                        return Center(
                          child: Container(
                            width: _animation.value,
                            height: _animation.value,
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        tx,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 20),
                    Consumer<TimerProvider>(
                      builder: (context, timerProvider, _) {
                        return Text(
                          '${timerProvider.seconds}',
                          style: TextStyle(fontSize: 48),
                        );
                      },
                    ),
                  ],
                ),
                Topbutton_main(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Shop()));
                          },
                          child: Image.asset(
                            height: 50,
                            "asset/image/icon/shop.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Image.asset(
                            height: 50,
                            "asset/image/icon/light.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                  ],
                ),
                isVisible ? FireflyAnimation() : SizedBox(),
                isVisible
                    ? Positioned(
                  top: MediaQuery.of(context).size.height * 0.7,
                  left: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            _timerProvider.stopTimer();
                            setState(() {
                              imagePath = 'asset/image/plants/default.png';
                              tx = "식물이 자고 있습니다. \n 테리리움에 핸드폰을 \n넣어 식물을 깨워주세요.";
                            });
                          },
                          child: Text('Stop'),
                        ),
                      ),
                    ],
                  ),
                )
                    : SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
