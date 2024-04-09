import 'package:capstone/const/color.dart';
import 'package:capstone/user/view/treedisplay.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {bool _isNFCAvailable = false;

@override
void initState() {
  super.initState();
  initNFC();
}

Future<void> initNFC() async {
  try {
    // Check NFC availability
    _isNFCAvailable = await NfcManager.instance.isAvailable();
    if (_isNFCAvailable) {
      // Start NFC session
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Do something with the discovered NFC tag
          print('NFC Tag discovered: ${tag.data}');
          if (tag.data != null) {
            String tagData = tag.data.toString();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tree()),
            );
          }
          // You can perform any action here, such as reading data from the tag
        },
      );
    }
  } catch (e) {
    print('Error initializing NFC: $e');
  }
}

@override
void dispose() {
  // Stop NFC session when the screen is disposed
  NfcManager.instance.stopSession();
  super.dispose();
}

// Future<void> _showMyDialog(String info) async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('NFC Tag Data'), // 다이얼로그 제목 변경
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text('NFC 태그 데이터:'),
//               Text(info),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('확인'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: _isNFCAvailable
          ? Text('NFC is available. Tap your NFC tag to interact.',style: TextStyle(color: primaryColor),)
          : Text('NFC is not available on this device.',style: TextStyle(color: primaryColor),),
    ),
  );
}
}

