import 'package:flutter/material.dart';
import 'package:capstone/const/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool autofocus;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.errorText,
    this.autofocus = false,
    this.obscureText = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseDecoration = InputDecoration(
      contentPadding: EdgeInsets.all(20),
      hintText: hintText,
      errorText: errorText,
      hintStyle: TextStyle(
        color: HINT_TEXT_COLOR,
        fontSize: 14.0,
      ),
      fillColor: INPUT_BG_COLOR,
      filled: true,
    );

    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(100), // 둥근 모서리 반경 지정
    );

    return TextFormField(
      cursorColor: primaryColor,
      autofocus: autofocus,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: baseDecoration.copyWith(
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
    );
  }
}
