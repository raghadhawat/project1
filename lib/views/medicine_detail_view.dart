import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharma_track/widgets/detaile_card.dart';

class MedicineDetaileView extends StatelessWidget {
  const MedicineDetaileView({super.key});
  static String id = 'MedicineDetaileView';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> details =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var inputDate1 = DateTime.parse(details['createdAt']);
    var outputFormat1 = DateFormat('yyyy-MM-dd');
    var outputDate1 = outputFormat1.format(inputDate1);
    print(outputDate1);

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
          )
        ],
      ),
      body: DetailCard(details: details, outputDate1: outputDate1),
    );
  }
}
