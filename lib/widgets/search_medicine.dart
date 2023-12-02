import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/views/medicine_detail_view.dart';

class SearchMedicine extends SearchDelegate {
  List? filter;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    filter = AllApiCubit.get(context)
        .medicineModel
        ?.data
        ?.where((element) =>
            element.scientificName!.toLowerCase().contains(query) ||
            element.tradeName!.toLowerCase().contains(query))
        .toList();
    return ListView.builder(
        itemCount: filter!.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MedicineDetaileView.id, arguments: {
                'name': "${filter![index].scientificName}",
                'tName': "${filter![index].tradeName}",
                'image': kLogo,
                'companyName': "${filter![index].companyName}",
                'form': "${filter![index].form}",
                'quantity': filter![index].quantity,
                'price': filter![index].price,
                'expirationAt': "${filter![index].expirationAt}",
                'details': "${filter![index].details}",
                'createdAt': "${filter![index].createdAt}",
                'updatedAt': "${filter![index].updatedAt}",
              });
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${filter![index].scientificName}",
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${filter![index].tradeName}",
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return ListView.builder(
          itemCount: AllApiCubit.get(context).medicineModel?.data?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MedicineDetaileView.id,
                    arguments: {
                      'name':
                          "${AllApiCubit.get(context).medicineModel!.data![index].scientificName}",
                      'tName':
                          "${AllApiCubit.get(context).medicineModel!.data![index].tradeName}",
                      'image': kLogo,
                      'companyName':
                          "${AllApiCubit.get(context).medicineModel!.data![index].companyName}",
                      'form':
                          "${AllApiCubit.get(context).medicineModel!.data![index].form}",
                      'quantity': AllApiCubit.get(context)
                          .medicineModel!
                          .data![index]
                          .quantity,
                      'price': AllApiCubit.get(context)
                          .medicineModel!
                          .data![index]
                          .price,
                      'expirationAt':
                          "${AllApiCubit.get(context).medicineModel!.data![index].expirationAt}",
                      'details':
                          "${AllApiCubit.get(context).medicineModel!.data![index].details}",
                      'createdAt':
                          "${AllApiCubit.get(context).medicineModel!.data![index].createdAt}",
                      'updatedAt':
                          "${AllApiCubit.get(context).medicineModel!.data![index].updatedAt}",
                    });
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AllApiCubit.get(context).medicineModel!.data![index].scientificName}",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "${AllApiCubit.get(context).medicineModel!.data![index].tradeName}",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ]),
                ),
              ),
            );
          });
    } else {
      filter = AllApiCubit.get(context)
          .medicineModel
          ?.data
          ?.where((element) =>
              element.scientificName!.toLowerCase().contains(query) ||
              element.tradeName!.toLowerCase().contains(query))
          .toList();
      return ListView.builder(
          itemCount: filter!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MedicineDetaileView.id,
                    arguments: {
                      'name': "${filter![index].scientificName}",
                      'tName': "${filter![index].tradeName}",
                      'image': kLogo,
                      'companyName': "${filter![index].companyName}",
                      'form': "${filter![index].form}",
                      'quantity': filter![index].quantity,
                      'price': filter![index].price,
                      'expirationAt': "${filter![index].expirationAt}",
                      'details': "${filter![index].details}",
                      'createdAt': "${filter![index].createdAt}",
                      'updatedAt': "${filter![index].updatedAt}",
                    });
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${filter![index].scientificName}",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "${filter![index].tradeName}",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ]),
                ),
              ),
            );
          });
    }
  }
}
