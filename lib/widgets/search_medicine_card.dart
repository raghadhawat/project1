import 'package:flutter/material.dart';

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
        child: Row(
          children: [
            Image.asset(
              image,
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    tname,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
