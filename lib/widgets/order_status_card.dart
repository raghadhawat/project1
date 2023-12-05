import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
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
        child: const Card(
          color: kThirdColor2,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'order.name',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'status',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
