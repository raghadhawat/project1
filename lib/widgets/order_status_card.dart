import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharma_track/constants.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
    required this.id,
    required this.date,
    required this.status,
    required this.paidStatus,
  });
  final int id;
  final String date, status, paidStatus;

  @override
  Widget build(BuildContext context) {
    var inputDate1 = DateTime.parse(date);
    var outputFormat1 = DateFormat('yyyy-MM-dd');
    var outputDate1 = outputFormat1.format(inputDate1);
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
      child: Container(
        decoration: BoxDecoration(
            color: kThirdColor, borderRadius: BorderRadius.circular(16)),
        height: 150,
        child: Card(
          color: kThirdColor2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Text(
                      'order number : $id ',
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' created at $outputDate1 ',
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Text(
                      'status :$status',
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'paid status : $paidStatus',
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
