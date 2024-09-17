  import 'package:capstone/component/dialogdeco.dart';
  import 'package:capstone/component/maindeco.dart';
  import 'package:capstone/component/maindialog.dart';
  import 'package:capstone/component/mainlight.dart';
  import 'package:capstone/component/top_button.dart';
  import 'package:capstone/component/top_button_main.dart';
  import 'package:capstone/const/color.dart';
  import 'package:capstone/provider/purchase_deco.dart';
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
    String defaultimagePath = 'asset/image/plants/default.png';
    String displayimagepath = "asset/image/plants/a";
    late String decoimagepath;
    String tx = "식물이 자고 있습니다. \n 테리리움에 핸드폰을 \n넣어 식물을 깨워주세요.";
    bool isVisible = false;
    bool stopButtonVisible = false;
    bool candetect = true;
    bool isselected = false;

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

    void toggleStopButton() {
      setState(() {
        candetect = true;
        stopButtonVisible = !stopButtonVisible;
      });
      if (!stopButtonVisible) {
        final _timerProvider = Provider.of<TimerProvider>(context, listen: false);
        _timerProvider.stopTimer();
        setState(() {
          defaultimagePath = 'asset/image/plants/default.png';
          tx = "식물이 자고 있습니다. \n 테리리움에 핸드폰을 \n넣어 식물을 깨워주세요.";
          isVisible = false;
        });
      }
    }

    void showSelectedImage(String ip) {
      displayimagepath = ip.substring(0, ip.length - 5);
    }

    void showDecoSelectedImage(String ip) {
      isselected = true;
      decoimagepath = ip.substring(0, ip.length - 5);
    }

    void changecolor(String cl) {}

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Consumer<NFCProvider>(
            builder: (context, nfcProvider, _) {
              final _timerProvider = Provider.of<TimerProvider>(context, listen: false);
              if (nfcProvider.isNFCDetected) {
                if (candetect) {
                  candetect = false;
                  tx = "성장중 . . .";
                  isVisible = true;
                  if (!_timerProvider.isRunning) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _timerProvider.startTimer();
                      setState(() {
                        stopButtonVisible = true;
                      });
                    });
                  }
                }
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
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => PurchasedItemsDialog(onItemSelected: showSelectedImage),
                                );
                              },
                              child: Container(
                                width: _animation.value,
                                height: _animation.value,
                                child: Consumer<TimerProvider>(
                                  builder: (context, timerProvider, child) {
                                    String newImagePath = displayimagepath + "${timerProvider.plantsIndex}.png";
                                    return Image.asset(
                                      isVisible ? newImagePath : defaultimagePath,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: Text(
                          tx,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 20),
                      Consumer<TimerProvider>(
                        builder: (context, timerProvider, _) {
                          return Container(
                            child: Text(
                              timerProvider.formattedTime,
                              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 30),
                      if (stopButtonVisible)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: BODY_TEXT_COLOR,
                            backgroundColor: primaryColor,
                            minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 50),
                          ),
                          onPressed: toggleStopButton,
                          child: Text("Stop"),
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
                          SizedBox(height: 100),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => Shop()));
                            },
                            child: Image.asset(
                              height: 50,
                              "asset/image/icon/shop.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => PurchasedLightDialog(onItemSelected: changecolor),
                              );
                            },
                            child: Image.asset(
                              height: 50,
                              "asset/image/icon/light.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => PurchasedDecoDialog(onItemSelected: showDecoSelectedImage),
                              );
                            },
                            child: Image.asset(
                              height: 50,
                              "asset/image/icon/bt.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                  isVisible ? FireflyAnimation() : SizedBox(),
                ],
              );
            },
          ),
        ),
      );
    }
  }
