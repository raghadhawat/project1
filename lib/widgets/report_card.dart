import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 35),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, right: 4),
                  child: Text(
                    "$index.",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Text(
                    '2024-10-01',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Text("500 SYP",
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
