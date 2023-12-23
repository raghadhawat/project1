import 'package:flutter/material.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: cubit.categoryModel1?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryCard(
                categoryName: "${cubit.categoryModel1?.data?[index].name}",
                id: cubit.categoryModel1?.data?[index].id,
              );
            }),
      ),
    );
  }
}
