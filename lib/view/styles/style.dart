import 'package:flutter/material.dart';

InputDecoration? decorationText({
  Color textColor = Colors.yellow,
  double textSize = 24,
  required String hintText,
}) =>
    InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: textColor, fontSize: textSize),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
    );
