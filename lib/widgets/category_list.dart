import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/models/category_model.dart';
import 'package:pharma_track/widgets/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    bool isLoading = false;
    return BlocConsumer<AllApiCubit, AllCategoryState>(
      listener: (context, state) {
        if (state is AllCategoryLoading) {
          isLoading = true;
        } else if (state is AllCategorySuccess) {
          isLoading = false;
        } else if (state is AllCategoryFailur) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: SizedBox(
              height: 130,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.categoryModel1?.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryCard(
                      categoryName:
                          "${cubit.categoryModel1?.data?[index].name}",
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
