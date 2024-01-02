import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.name,
    required this.quantity,
    required this.id,
  });
  final String name;
  final int quantity;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
      child: Container(
        decoration: BoxDecoration(
            color: kThirdColor, borderRadius: BorderRadius.circular(16)),
        height: 110,
        child: Card(
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: 90,
                decoration: const BoxDecoration(
                  color: Color(0xff31a9e3),
                ),
                child: Center(
                    child: Text(
                  '$id',
                  style: const TextStyle(
                      color: kThirdColor2,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        name,
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
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
