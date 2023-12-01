import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/enter_model.dart';
import 'package:pharma_track/models/log_out_service.dart';
import 'package:pharma_track/services/login_service.dart';
import 'package:pharma_track/services/sign_up_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  EnterReponseModel? enterResponseModel;
  String? token1;
  login({required String phone, required String password}) async {
    emit(LoginLoading());

    try {
      enterResponseModel =
          await LoginService().loginUser(password: password, phone: phone);

      token1 = enterResponseModel!.data!.token;
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  signUp({
    required String pharmacyName,
    required String address,
    required String pharmacistName,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    try {
      enterResponseModel = await SignUpService().signUpUser(
        password: password,
        phone: phone,
        pharmacyName: pharmacyName,
        address: address,
        pharmacistName: pharmacistName,
        email: email,
        confirmPassword: confirmPassword,
      );

      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }

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
