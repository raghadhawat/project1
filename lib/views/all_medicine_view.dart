import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/medicine_view.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/category_list.dart';
import 'package:pharma_track/widgets/all_medicine_list.dart';
import 'package:pharma_track/widgets/search_all_medicine.dart';
import 'package:pharma_track/widgets/search_category.dart';

class AllMedicineView extends StatelessWidget {
  const AllMedicineView({super.key});
  static String id = 'AllMedicineView';
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AllApiCubit, AllApiState>(listener: (context, state) {
      if (state is MedicineLoading) {
        isLoading = true;
      } else if (state is MedicineSuccess) {
        Navigator.pushNamed(context, MedicineView.id);
        isLoading = false;
      } else if (state is MedicineFailure) {
        showSnakbar(context, state.errMessage);
        isLoading = false;
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const AppBarText(),
          actions: [
            PopupMenuButton(
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text(
                          'Category',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                        onTap: () {
                          showSearch(
                              context: context, delegate: SearchCategory());
                        },
                      ),
                      PopupMenuItem(
                        child: const Text(
                          'Medicine',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                        onTap: () {
                          showSearch(
                              context: context, delegate: SearchAllMedicine());
                        },
                      )
                    ])
          ],
        ),
        body: BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          child: const Padding(
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
        ),
      );
    });
  }
}
