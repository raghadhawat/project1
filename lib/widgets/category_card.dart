import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  Color textColor = kPrimaryColor;
  Color color = kThirdColor2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        color = kSecondColor2;
        textColor = kThirdColor;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 300,
          width: 220,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              widget.categoryName,
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
