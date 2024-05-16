// import 'package:flutter/material.dart';
// import 'package:capstone/component/img_button.dart';
//
// class MyList extends StatefulWidget {
//   const MyList({super.key});
//
//   @override
//   State<MyList> createState() => _MyListState();
// }
//
// class _MyListState extends State<MyList> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
//
// Future<void> _dialogBuilder(BuildContext context) {
//   // 현재 화면 위에 보여줄 다이얼로그 생성
//   return showDialog<void>(
//     context: context,
//     builder: (context) {
//       // 빌더로 AlertDialog 위젯을 생성
//       return AlertDialog(
//         title: const Text('다이얼로그 제목'),
//         content: const Text('다이얼로그 내용'),
//         actions: [
//           ElevatedButton(
//             // 다이얼로그 내의 확인 버튼 터치 시 값 +1
//             onPressed: () {
//               setState(() => value++);
//             },
//             child: const Text('확인'),
//           ),
//           // 다이얼로그 내의 취소 버튼 터치 시 다이얼로그 화면 제거
//           OutlinedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('취소'),
//           ),
//         ],
//       );
//     },
//   );
// }
//
