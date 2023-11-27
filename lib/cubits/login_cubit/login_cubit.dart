import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharma_track/models/enter_model.dart';
import 'package:pharma_track/services/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  EnterResponseModel? loginResponseModel;
  login({required String phone, required String password}) async {
    emit(LoginLoading());

    try {
      loginResponseModel =
          await LoginService().loginUser(password: password, phone: phone);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
