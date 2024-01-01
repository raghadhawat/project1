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
      itemCount: cubit.showFavouritrModel?.data?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FavouriteCard(
            tName: "${cubit.showFavouritrModel?.data?[index].tradeName}",
            name: "${cubit.showFavouritrModel?.data?[index].scientificName}",
            image: "${cubit.showFavouritrModel?.data?[index].photo}",
            companyName:
                "${cubit.showFavouritrModel?.data?[index].companyName}",
            form: "${cubit.showFavouritrModel?.data?[index].form}",
            details: "${cubit.showFavouritrModel?.data?[index].details}",
            expirationAt:
                '${cubit.showFavouritrModel?.data?[index].expirationAt}',
            createdAt: '${cubit.showFavouritrModel?.data?[index].createdAt}',
            updatedAt: '${cubit.showFavouritrModel?.data?[index].updatedAt}',
            price: cubit.showFavouritrModel?.data?[index].price,
            quantity: cubit.showFavouritrModel?.data?[index].quantity,
            id: cubit.showFavouritrModel?.data?[index].id,
          ),
        );
      },
    );
  }
}
