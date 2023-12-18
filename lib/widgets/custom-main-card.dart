import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class CustomMainCard extends StatelessWidget {
  const CustomMainCard({super.key, this.onTap, required this.image});

  final String image;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 195,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(image),
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: kPrimaryColor.withOpacity(.05),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Text(''),
      ),
    );
  }
}
