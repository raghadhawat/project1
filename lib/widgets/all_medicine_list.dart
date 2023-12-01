import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/widgets/medicine_tile.dart';

class AllMedicineList extends StatelessWidget {
  const AllMedicineList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return BlocConsumer<AllApiCubit, AllApiState>(listener: (context, state) {
      if (state is MedicineLoading) {
      } else if (state is MedicineSuccess) {
      } else if (state is MedicineFailure) {
        showSnakbar(context, state.errMessage);
      }
    }, builder: (context, state) {
      return SizedBox(
        height: 700,
        child: GridView.builder(
          itemCount: cubit.allMedicineModel?.data?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: MedicineTile(
                tName: "${cubit.allMedicineModel?.data?[index].tradeName}",
                name: "${cubit.allMedicineModel?.data?[index].scientificName}",
                image: kLogo,
                companyName:
                    "${cubit.allMedicineModel?.data?[index].companyName}",
                form: "${cubit.allMedicineModel?.data?[index].form}",
                details: "${cubit.allMedicineModel?.data?[index].details}",
                expirationAt:
                    '${cubit.allMedicineModel?.data?[index].expirationAt}',
                createdAt: '${cubit.allMedicineModel?.data?[index].createdAt}',
                updatedAt: '${cubit.allMedicineModel?.data?[index].updatedAt}',
                price: cubit.allMedicineModel?.data?[index].price,
                quantity: cubit.allMedicineModel?.data?[index].quantity,
              ),
            );
          },
        ),
      );
    });
  }
}
