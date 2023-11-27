import 'package:flutter/material.dart';
import 'package:pharma_track/widgets/medicine_tile.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: 10,
      (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: MedicineTile(),
        );
      },
    ));
  }
}
