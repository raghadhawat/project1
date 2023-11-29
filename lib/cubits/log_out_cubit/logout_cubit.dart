import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/log_out_service.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  static LogoutCubit get(context) => BlocProvider.of(context);
  //////   logout service

  logOut(context) async {
    emit(LogoutLoading());
    try {
      await getLogOut(context);

      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }

  LogOutModel? logOutModel;
  Future<List<dynamic>?> getLogOut(context) async {
    //print(cubit.enterResponseModel!.token);
    await Api()
        .get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/logout',
      token: AuthCubit.get(context).enterResponseModel!.data!.token,
    )
        .then((value) {
      logOutModel = LogOutModel.fromJson(value);
      print("${logOutModel!.messege!.message}");
    });
  }
}
