import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:pharma_track/models/category_model.dart';
import 'package:pharma_track/widgets/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    AllCategoryCubit cubit = AllCategoryCubit.get(context);
    List<dynamic>? category = ['all'];
    // cubit.categoryModel;
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 130,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: category!.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryCard(
                categoryName: category[index],
              );
            }),
      ),
    );
  }
}
