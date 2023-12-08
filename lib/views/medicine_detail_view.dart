import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/detaile_card.dart';
import 'package:pharma_track/widgets/medicine_buttom_sheet.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return MedicineButtomSheeet(
                  name: details['name'],
                );
              });
        },
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const AppBarText(),
      ),
      body: DetailCard(details: details, outputDate1: outputDate1),
    );
  }
}
