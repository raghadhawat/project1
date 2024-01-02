import 'package:flutter/material.dart';
import 'package:pharma_track/widgets/medicine_list.dart';
import 'package:pharma_track/widgets/search_medicine.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({super.key});
  static String id = 'MedicineView';

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
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchMedicine());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.grey,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_none_rounded,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ],
        ),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: EdgeInsets.only(top: 12),
              child: MedicineList(),
            )));
  }
}
