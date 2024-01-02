import 'package:flutter/material.dart';
import 'package:pharma_track/widgets/report_card.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});
  static String id = 'ReportView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
                size: 32,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_none_rounded,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              child: Text(
                "report of this month",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ReportCard(
                    index: index,
                  );
                },
              ),
            ),
            Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 7),
              height: 40,
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "500 SYP",
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff31a9e3),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
