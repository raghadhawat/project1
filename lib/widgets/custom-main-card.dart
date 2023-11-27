import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class CustomMainCard extends StatelessWidget {
  const CustomMainCard(
      {super.key, required this.color, required this.title, this.onTap});
  final Color color;
  final String title;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        width: 170,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 15,
              color: kSecondColor,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: color == kSecondColor2 ? kThirdColor : kPrimaryColor,
              fontFamily: kFont2,
            ),
          ),
        ),
      ),
    );
  }
}
