import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/category_model.dart';
import 'package:pharma_track/models/log_out_service.dart';
import 'package:pharma_track/models/medicine_model.dart';

part 'all_api_state.dart';

class AllApiCubit extends Cubit<AllApiState> {
  AllApiCubit() : super(AllApiInitial());
  static AllApiCubit get(context) => BlocProvider.of(context);

//////   logout service

  logOut(context) async {
    emit(AllApiLoading());
    try {
      await getLogOut(context);

      emit(AllApiSuccess());
    } catch (e) {
      emit(AllApiFailur(e.toString()));
    }
  }

  LogOutModel? logOutModel;
  Future<List<Data>?> getLogOut(context) async {
    //print(cubit.enterResponseModel!.token);
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/logout',
      token: AuthCubit.get(context).enterResponseModel!.token,
    )
        .then((value) {
      logOutModel = LogOutModel.fromJson(value);
      print(logOutModel!.messege!.message);
    });
  }

  //// category service

  allCategory(context) async {
    emit(AllApiLoading());
    try {
      await getLogOut(context);

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
      token: AuthCubit.get(context).enterResponseModel!.token,
    )
        .then((value) {
      categoryModel1 = CategoryModel.fromJson(value);
      print(categoryModel1!.data![2].name);
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
  Future<List<MedicineData>?> getAllMedicine(context) async {
    print(AuthCubit.get(context).enterResponseModel!.token);
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/medicines',
      token: AuthCubit.get(context).enterResponseModel!.token,
    )
        .then((value) {
      allMedicineModel = AllMedicineModel.fromJson(value);
      print(allMedicineModel!.data![2].tradeName);
    });
  }
}
