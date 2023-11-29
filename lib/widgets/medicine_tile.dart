import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class MedicineTile extends StatelessWidget {
  const MedicineTile({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: kThirdColor2, borderRadius: BorderRadius.circular(10)),
        height: 85,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontFamily: kFont2,
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.add,
              size: 35,
              color: kPrimaryColor,
            ),
            const SizedBox(
              width: 24,
            ),
            const Icon(
              Icons.favorite,
              size: 32,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
