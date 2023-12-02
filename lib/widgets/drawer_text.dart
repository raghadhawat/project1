import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/theme_color.dart';

class DrawerText extends StatelessWidget {
  const DrawerText({
    super.key,
    required this.title,
    required this.icon,
    required this.size,
  });
  final String title;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: ThemeColor(), borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: kFont2,
                fontSize: size,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
