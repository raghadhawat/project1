import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/models/category_model.dart';
import 'package:pharma_track/services/all_category_service.dart';

part 'all_category_state.dart';

class AllCategoryCubit extends Cubit<AllCategoryState> {
  AllCategoryCubit() : super(AllCategoryInitial());

  List<CategoryModel>? categoryModel;
  allCategory() async {
    emit(AllCategoryLoading());
    categoryModel = await AllCategoryService().getAllCategory();
    try {
      categoryModel = await AllCategoryService().getAllCategory();
      emit(AllCategorySuccess());
    } catch (e) {
      emit(AllCategoryFailur(e.toString()));
    }
  }
}
