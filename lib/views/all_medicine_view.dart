import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/category_list.dart';
import 'package:pharma_track/widgets/all_medicine_list.dart';

class AllMedicineView extends StatelessWidget {
  const AllMedicineView({super.key});
  static String id = 'AllMedicineView';
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
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryList()),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(child: AllMedicineList()),
          ],
        ),
      ),
    );
  }
}
