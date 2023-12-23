import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.categoryName, required this.id});

  final String categoryName;
  int? id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AllApiCubit>(context).medicine(context, id: id!);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 180,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: const TextStyle(
                color: kThirdColor2,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
