import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/enter_model.dart';
import 'package:pharma_track/models/log_out_service.dart';
import 'package:pharma_track/services/login_service.dart';
import 'package:pharma_track/services/sign_up_service.dart';
import 'package:hive/hive.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String baseUrl = 'http://192.168.42.66:8000/api';
  static AuthCubit get(context) => BlocProvider.of(context);
  EnterReponseModel? enterResponseModel;
  String? token1;
  String? token;
  login({required String phone, required String password}) async {
    emit(LoginLoading());

    try {
      enterResponseModel =
          await LoginService().loginUser(password: password, phone: phone);

      token = enterResponseModel!.data!.token;
      Hive.box(kToken).put(kToken1, token);
      token1 = Hive.box(kToken).get(kToken1);
      print("${token1}ssssssssssssssssssssssss");

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
      token = enterResponseModel!.data!.token;
      Hive.box(kToken).put(kToken1, token);
      token1 = Hive.box(kToken).get(kToken1);
      print("${token1}ssssssssssssssssssssssss");
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
      url: '$baseUrl/Pharmacy/logout',
      token: Hive.box(kToken).get(kToken),
    )
        .then((value) {
      logOutModel = LogOutModel.fromJson(value);
      print("${logOutModel!.messege!.message}");
    });
  }
}
