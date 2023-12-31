import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharma_track/constants.dart';

class OrderStatusCard extends StatelessWidget {
  OrderStatusCard({
    super.key,
    required this.id,
    required this.date,
    required this.status,
    required this.paidStatus,
  });
  int? id;
  String? date, status, paidStatus;

  @override
  Widget build(BuildContext context) {
    var inputDate1 = DateTime.parse(date ?? "0000-00-00");
    var outputFormat1 = DateFormat('yyyy-MM-dd');
    var outputDate1 = outputFormat1.format(inputDate1);
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
      child: Container(
        decoration: BoxDecoration(
            color: kThirdColor2, borderRadius: BorderRadius.circular(16)),
        height: 170,
        child: Card(
          color: kThirdColor2,
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: 90,
                decoration: const BoxDecoration(color: Color(0xff7BD3EA)),
                child: Center(
                    child: Text(
                  '$id ',
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sended at $outputDate1 ',
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'status :$status',
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
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
