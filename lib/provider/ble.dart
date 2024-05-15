import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  late FlutterBluePlus flutterBluePlus;
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? writeCharacteristic;

  @override
  void initState() {
    super.initState();
    flutterBluePlus = FlutterBluePlus.instance;
    // BLE 상태 변경 감지
    flutterBluePlus.state.listen((state) {
      if (state == BluetoothState.on) {
        // 스캔 시작
        scanForDevices();
      }
    });
  }

  // BLE 장치 검색
  void scanForDevices() {
    flutterBluePlus.startScan(timeout: Duration(seconds: 4));
    flutterBluePlus.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (result.device.name == 'YourESP32DeviceName') {
          // 원하는 ESP32 디바이스를 찾았을 때 연결 시도
          connectToDevice(result.device);
          break;
        }
      }
    });
  }

  // BLE 장치 연결
  void connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      List<BluetoothService> services = await device.discoverServices();
      services.forEach((service) {
        service.characteristics.forEach((characteristic) {
          // 원하는 characteristic을 찾아 writeCharacteristic에 할당
          if (characteristic.uuid.toString() == '0000ffe1-0000-1000-8000-00805f9b34fb') {
            writeCharacteristic = characteristic;
          }
        });
      });
      setState(() {
        connectedDevice = device;
      });
    } catch (e) {
      print('Failed to connect: $e');
    }
  }

  // 데이터 전송
  void sendData(int data) {
    if (connectedDevice != null && writeCharacteristic != null) {
      // 연결된 장치와 characteristic이 있을 때 데이터 전송
      List<int> bytes = [data];
      writeCharacteristic!.write(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Control'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 여기에 데이터를 보내는 로직을 호출
            sendData(1); // 예시로 1을 보냅니다.
          },
          child: Text('Send Data'),
        ),
      ),
    );
  }
}
