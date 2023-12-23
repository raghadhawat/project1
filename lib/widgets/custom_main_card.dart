import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class CustomMainCard extends StatelessWidget {
  const CustomMainCard(
      {super.key,
      this.onTap,
      required this.name,
      required this.image,
      required this.height,
      required this.leftPadding});

  final String name, image;
  final double height, leftPadding;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 125,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kThirdColor,
            border: Border.all(color: kSecondColor, width: 2),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: kPrimaryColor.withOpacity(.05),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: leftPadding),
                    child: Image.asset(
                      image,
                      height: height,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
