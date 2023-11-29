import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/widgets/medicine_tile.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return BlocConsumer<AllApiCubit, AllCategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: cubit.allMedicineModel?.data?.length,
            (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: MedicineTile(
                  name: "${cubit.allMedicineModel?.data?[index].tradeName}",
                ),
              );
            },
          ));
        });
  }
}
