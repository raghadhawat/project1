import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/medicine_tile.dart';

class AllMedicineList extends StatelessWidget {
  const AllMedicineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return SizedBox(
      height: 600,
      child: GridView.builder(
        itemCount: cubit.allMedicineModel?.data?.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MedicineTile(
              tName: "${cubit.allMedicineModel?.data?[index].tradeName}",
              name: "${cubit.allMedicineModel?.data?[index].scientificName}",
              image: kLogo,
            ),
          );
        },
      ),
    );
  }
}
