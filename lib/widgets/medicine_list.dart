import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:pharma_track/widgets/medicine_tile.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MedicineCubit cubit = MedicineCubit.get(context);

    return BlocConsumer<MedicineCubit, MedicineState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GridView.builder(
            itemCount: cubit.medicineModel?.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: MedicineTile(
                  tName: "${cubit.medicineModel?.data?[index].tradeName}",
                  name: "${cubit.medicineModel?.data?[index].scientificName}",
                  image: kLogo,
                ),
              );
            },
          );
        });
  }
}
