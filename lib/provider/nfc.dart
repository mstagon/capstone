import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:capstone/user/view/treedisplay.dart';

class NFCProvider with ChangeNotifier {
  bool _isNFCDetected = false;
  bool get isNFCDetected => _isNFCDetected;

  Future<void> detectNFC() async {
    try {
      bool isNFCAvailable = await NfcManager.instance.isAvailable();
      if (isNFCAvailable) {
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            _isNFCDetected = true;
            notifyListeners();

            await Future.delayed(Duration(seconds: 1));
            _resetNFCDetection();

            NfcManager.instance.stopSession();
          },
        );
      }
    } catch (e) {
      print('Error detecting NFC: $e');
    }
  }

  void _resetNFCDetection() {
    _isNFCDetected = false;
    notifyListeners();
  }
}
