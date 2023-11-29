import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/category_list.dart';
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
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryList()),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
            MedicineList(),
          ],
        ),
      ),
    );
  }
}
