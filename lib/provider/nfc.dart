import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:capstone/user/view/treedisplay.dart';

class NFCProvider with ChangeNotifier {
  bool _isNFCDetected = false;
  bool get isNFCDetected => _isNFCDetected;

  Future<void> detectNFC() async {
    try {
      // Check NFC availability
      bool isNFCAvailable = await NfcManager.instance.isAvailable();
      if (isNFCAvailable) {
        // Start NFC session
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            // Set NFC detected to true
            _isNFCDetected = true;
            notifyListeners();
            NfcManager.instance.stopSession();
          },
        );
      }
    } catch (e) {
      print('Error detecting NFC: $e');
    }
  }
}
