import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class MedicineTile extends StatelessWidget {
  const MedicineTile({super.key});

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
        child: const Row(
          children: [
            Text(
              'cetamol',
              style: TextStyle(
                fontFamily: kFont2,
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.add,
              size: 35,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 24,
            ),
            Icon(
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
