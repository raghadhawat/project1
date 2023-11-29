import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
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
      categoryModel = await AllCategoryService().getAllCategory(context);
      emit(AllCategorySuccess());
    } catch (e) {
      emit(AllCategoryFailur(e.toString()));
    }
  }
}
