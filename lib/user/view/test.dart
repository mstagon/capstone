import 'package:capstone/component/top_button.dart';
import 'package:capstone/const/color.dart';
import 'package:capstone/provider/timer.dart';
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
  late NFCProvider _nfcProvider;
  late TimerModel _timerProvider;
  late AnimationController _controller;
  late Animation<double> _animation;
  String imagePath = 'asset/image/plants/default.png';
  String tx = "성장중 . . .";
  bool isVisible = true;
  Duration _elapsedTime = Duration.zero;
  bool _isRunning = false;
  late Stopwatch _stopwatch;
  dynamic textcolor = BODY_TEXT_COLOR;

  @override
  void initState() {
    super.initState();
    _nfcProvider = Provider.of<NFCProvider>(context, listen: false);
    _timerProvider = Provider.of<TimerModel>(context, listen: false);
    _nfcProvider.detectNFC();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true); // 애니메이션을 반복하고 역방향으로도 실행합니다.
    _animation = Tween<double>(begin: 200.0, end: 210.0).animate(_controller);
  }

  void _stopStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _isRunning = false;
      imagePath = 'asset/image/plants/default.png';
      tx = "식물이 자고 있습니다. \n 테리리움에 핸드폰을 \n넣어 식물을 깨워주세요.";
      isVisible = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    String hour =_timerProvider.hours.toString();
    String minute = _timerProvider.minutes.toString();
    String sec = _timerProvider.seconds.toString();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Consumer2<NFCProvider, TimerModel>(
          builder: (context, nfcProvider,timerProvider, _) {
            if (nfcProvider.isNFCDetected) {
              imagePath = 'asset/image/plants/a3.png';
              tx = "";
              isVisible = true;
              _timerProvider.startTimer;
            } else {
              imagePath = 'asset/image/plants/default.png';
              tx = "식물이 자고 있습니다. \n 테리리움에 핸드폰을 \n넣어 식물을 깨워주세요.";
              isVisible = false;
            }
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Topbutton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: Image.asset(
                            "asset/image/icon/shop.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Image.asset(
                            "asset/image/icon/light.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                isVisible ? FireflyAnimation() : SizedBox(),
                isVisible
                    ? Positioned(
                        top: MediaQuery.of(context).size.height * 0.7,
                        left: MediaQuery.of(context).size.width * 0.25,
                        child: Column(
                          children: [
                            Text(
                              '몰라',
                              style:
                                  TextStyle(fontSize: 48, color: textcolor),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: _stopStopwatch,
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
