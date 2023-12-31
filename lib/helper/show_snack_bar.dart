import 'package:flutter/material.dart';

void showSnakbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      backgroundColor: Color(0xff31a9e3),
      content: Text(
        message.substring(10),
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
    ),
  );
}
