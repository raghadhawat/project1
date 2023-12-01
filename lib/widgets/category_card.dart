import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:pharma_track/views/medicine_view.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.categoryName, required this.id});

  String categoryName;
  int? id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MedicineCubit>(context).medicine(context, id: id!);
        Navigator.pushNamed(context, MedicineView.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 300,
          width: 220,
          decoration: BoxDecoration(
            color: kSecondColor2,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: const TextStyle(
                color: kThirdColor2,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
