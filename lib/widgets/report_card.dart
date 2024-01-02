import 'package:flutter/material.dart';
import 'package:pharma_track/models/report_model.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.list,
  });
  final ReportData list;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 35),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Text(
                    list.createdAt!.substring(0, 10),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Text("${list.totalPrice}SYP",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      )),
                )
              ],
            ),
          ),
        ),
        // Divider(
        //   thickness: 2,
        //   endIndent: 30,
        //   indent: 30,
        // )
      ],
    );
  }
}
