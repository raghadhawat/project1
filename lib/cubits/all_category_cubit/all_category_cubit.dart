import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/category_model.dart';
import 'package:pharma_track/services/all_category_service.dart';

part 'all_category_state.dart';

class AllCategoryCubit extends Cubit<AllCategoryState> {
  AllCategoryCubit() : super(AllCategoryInitial());
  static AllCategoryCubit get(context) => BlocProvider.of(context);
  List<dynamic>? categoryModel;
  allCategory(context) async {
    emit(AllCategoryLoading());
    try {
      categoryModel = await getAllCategory(context);

      emit(AllCategorySuccess());
    } catch (e) {
      emit(AllCategoryFailur(e.toString()));
    }
  }

  CategoryModel? categoryModel1;
  Future<List<Data>?> getAllCategory(context) async {
    //print(cubit.enterResponseModel!.token);
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/category',
      token: AuthCubit.get(context).enterResponseModel!.token,
    )
        .then((value) {
      categoryModel1 = CategoryModel.fromJson(value);
      print(categoryModel1!.data![2].name);
    });
    List<Data>? jsonData = categoryModel1!.data;
  }
}
