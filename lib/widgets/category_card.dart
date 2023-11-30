import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/views/medicine_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MedicineView.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 300,
          width: 220,
          decoration: BoxDecoration(
            color: kSecondColor2,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: const TextStyle(
                color: kThirdColor2,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
