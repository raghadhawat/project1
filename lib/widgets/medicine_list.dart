import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';

import 'package:pharma_track/widgets/midicine_tile2.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is MedicineLoading2) {
        } else if (state is MedicineSuccess2) {
        } else if (state is MedicineFailure2) {
          showSnakbar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: cubit.medicineModel?.data?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: MedicineTile2(
                tName: "${cubit.medicineModel?.data?[index].tradeName}",
                name: "${cubit.medicineModel?.data?[index].scientificName}",
                image: "${cubit.medicineModel?.data?[index].photo}",
                companyName: "${cubit.medicineModel?.data?[index].companyName}",
                form: "${cubit.medicineModel?.data?[index].form}",
                details: "${cubit.medicineModel?.data?[index].details}",
                expirationAt:
                    '${cubit.medicineModel?.data?[index].expirationAt}',
                createdAt: '${cubit.medicineModel?.data?[index].createdAt}',
                updatedAt: '${cubit.medicineModel?.data?[index].updatedAt}',
                price: cubit.medicineModel?.data?[index].price,
                quantity: cubit.medicineModel?.data?[index].quantity,
                id: cubit.medicineModel?.data?[index].id,
                favourite: cubit.medicineModel2?.data?[index].favorite,
                catId: cubit.medicineModel?.catId,
              ),
            );
          },
        );
      },
    );
  }
}
