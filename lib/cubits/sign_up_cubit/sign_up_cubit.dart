import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/models/enter_model.dart';
import 'package:pharma_track/services/sign_up_service.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  EnterResponseModel? loginResponseModel;
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
      loginResponseModel = await SignUpService().signUpUser(
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
