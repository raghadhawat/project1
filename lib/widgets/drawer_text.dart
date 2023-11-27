import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class DrawerText extends StatelessWidget {
  const DrawerText({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: kFont2,
          fontSize: 30,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
