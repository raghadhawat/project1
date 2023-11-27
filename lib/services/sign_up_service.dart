import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/enter_model.dart';

class SignUpService {
  Future<EnterResponseModel> signUpUser({
    required String pharmacyName,
    required String address,
    required String pharmacistName,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'http://10.0.2.2:8000/api/Pharmacy/register',
      body: {
        'name': pharmacistName,
        'userName': pharmacyName,
        'userNumber': phone,
        'address': address,
        'email': email,
        'password': password,
        'c_password': confirmPassword,
      },
    );

    EnterResponseModel signupResponseModel = EnterResponseModel.fromJson(data);
    return signupResponseModel;
  }
}
