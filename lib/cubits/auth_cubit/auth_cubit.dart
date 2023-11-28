import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/models/enter_model.dart';
import 'package:pharma_track/services/login_service.dart';
import 'package:pharma_track/services/sign_up_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  EnterResponseModel? enterResponseModel;
  login({required String phone, required String password}) async {
    emit(LoginLoading());

    try {
      enterResponseModel =
          await LoginService().loginUser(password: password, phone: phone);
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
}
