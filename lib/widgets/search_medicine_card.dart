import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class SearchMedicineCard extends StatelessWidget {
  const SearchMedicineCard({
    super.key,
    required this.image,
    required this.name,
    required this.tname,
  });
  final String image, name, tname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, right: 2, left: 2),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: 100,
        child: Card(
          child: Row(
            children: [
              Image.asset(image),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      tname,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
