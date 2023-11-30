import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/category_model.dart';
import 'package:pharma_track/models/all_medicine_model.dart';

part 'all_api_state.dart';

class AllApiCubit extends Cubit<AllApiState> {
  AllApiCubit() : super(AllApiInitial());
  static AllApiCubit get(context) => BlocProvider.of(context);

  //// category service

  allCategory(context) async {
    emit(AllApiLoading());
    try {
      await getAllCategory(context);

      emit(AllApiSuccess());
    } catch (e) {
      emit(AllApiFailur(e.toString()));
    }
  }

  CategoryModel? categoryModel1;
  Future<List<Data>?> getAllCategory(context) async {
    //print(cubit.enterResponseModel!.token);
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/category',
      token: AuthCubit.get(context).enterResponseModel!.data!.token,
    )
        .then((value) {
      categoryModel1 = CategoryModel.fromJson(value);
    });
  }

  /// all medicine service

  allMedicine(context) async {
    emit(AllApiLoading());
    try {
      await getAllMedicine(context);

      emit(AllApiSuccess());
    } catch (e) {
      emit(AllApiFailur(e.toString()));
    }
  }

  AllMedicineModel? allMedicineModel;
  Future<List<AllMedicineData>?> getAllMedicine(context) async {
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/medicines',
      token: AuthCubit.get(context).enterResponseModel!.data!.token,
    )
        .then((value) {
      allMedicineModel = AllMedicineModel.fromJson(value);
    });
  }
}
