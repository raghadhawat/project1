import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/services/all_category_service.dart';

part 'all_category_state.dart';

class AllCategoryCubit extends Cubit<AllCategoryState> {
  AllCategoryCubit() : super(AllCategoryInitial());

  List<dynamic>? category;
  allCategory() async {
    emit(AllCategoryLoading());
    try {
      category = await AllCategoryService().getAllCategory();
      emit(AllCategorySuccess());
    } catch (e) {
      emit(AllCategoryFailur(e.toString()));
    }
  }
}
