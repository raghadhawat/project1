import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      kName,
      style: TextStyle(
        fontFamily: kFont2,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: kThirdColor,
      ),
    );
  }
}
