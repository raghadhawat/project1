import 'package:flutter/material.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/favourite_card.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return ListView.builder(
      itemCount: cubit.medicineModel?.data?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FavouriteCard(
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
            id: cubit.allMedicineModel?.data?[index].id,
          ),
        );
      },
    );
  }
}