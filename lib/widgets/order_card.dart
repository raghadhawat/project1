import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
      child: Container(
        decoration: BoxDecoration(
            color: kThirdColor, borderRadius: BorderRadius.circular(16)),
        height: 100,
        child: Card(
          color: kThirdColor2,
          child: Row(
            children: [
              Image.asset(kLogo),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'cetamol',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'bara',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  '4',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
