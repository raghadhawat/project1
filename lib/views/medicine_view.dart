import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/medicine_list.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({super.key});
  static String id = 'MedicineView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const AppBarText(),
        ),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: EdgeInsets.only(top: 12),
              child: MedicineList(),
            )));
  }
}
