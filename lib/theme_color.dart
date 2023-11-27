import 'package:flutter/material.dart';

LinearGradient ThemeColor() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffabdbe3),
      Color(0xffeeeee4),
      Colors.white,
    ],
  );
}
