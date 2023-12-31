import 'package:flutter/material.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/medicine_tile.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return GridView.builder(
      itemCount: cubit.medicineModel?.data?.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: MedicineTile(
            tName: "${cubit.medicineModel?.data?[index].tradeName}",
            name: "${cubit.medicineModel?.data?[index].scientificName}",
            image: "${cubit.medicineModel?.data?[index].photo}",
            companyName: "${cubit.medicineModel?.data?[index].companyName}",
            form: "${cubit.medicineModel?.data?[index].form}",
            details: "${cubit.medicineModel?.data?[index].details}",
            expirationAt: '${cubit.medicineModel?.data?[index].expirationAt}',
            createdAt: '${cubit.medicineModel?.data?[index].createdAt}',
            updatedAt: '${cubit.medicineModel?.data?[index].updatedAt}',
            price: cubit.medicineModel?.data?[index].price,
            quantity: cubit.medicineModel?.data?[index].quantity,
          ),
        );
      },
    );
  }
}
