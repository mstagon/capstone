import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/battery.dart';
import '../provider/nfc.dart';
import '../user/view/treedisplay.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late NFCProvider _nfcProvider;
  late BatteryProvider _batteryProvider;

  @override
  void initState() {
    super.initState();
    _nfcProvider = Provider.of<NFCProvider>(context, listen: false);
    _nfcProvider.detectNFC();
    _batteryProvider = Provider.of<BatteryProvider>(context, listen: false);
    _batteryProvider.detectCharging();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer2<NFCProvider, BatteryProvider>(
          builder: (context, nfcProvider, batteryProvider, _) {
            if (nfcProvider.isNFCDetected || batteryProvider.isCharging) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tree()),
                );
              });
            }
            return Text(
              nfcProvider.isNFCDetected
                  ? 'NFC Detected! Navigating...'
                  : 'Waiting for NFC Detection...',
            );
          },
        ),
      ),
    );
  }
}
