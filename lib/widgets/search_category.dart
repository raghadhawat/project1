import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';

class CustomSearch extends SearchDelegate {
  List? filter;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('s');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return ListView.builder(
          itemCount: AllApiCubit.get(context).categoryModel1?.data?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<AllApiCubit>(context).medicine(context,
                    id: AllApiCubit.get(context)
                        .categoryModel1!
                        .data![index]
                        .id!);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${AllApiCubit.get(context).categoryModel1?.data?[index].name}",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          });
    } else {
      filter = AllApiCubit.get(context)
          .categoryModel1
          ?.data
          ?.where((element) => element.name!.toLowerCase().contains(query))
          .toList();
      return ListView.builder(
          itemCount: filter!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<AllApiCubit>(context)
                    .medicine(context, id: filter![index].id);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${filter![index].name}",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          });
    }
  }
}
