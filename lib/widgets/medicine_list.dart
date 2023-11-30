import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/medicine_tile.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return BlocConsumer<AllApiCubit, AllApiState>(
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
