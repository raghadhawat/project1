import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'PharmaTrack',
      style: TextStyle(
        fontFamily: kFont1,
        fontSize: 30,
        color: kThirdColor,
      ),
    );
  }
}
