import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/enter_model.dart';

class LoginService {
  String baseUrl = 'http://192.168.42.66:8000/api';
  Future<EnterReponseModel> loginUser({
    required String phone,
    required String password,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: '$baseUrl/Pharmacy/login', body: {
      'userNumber': phone,
      'password': password,
    });

    EnterReponseModel loginResponseModel = EnterReponseModel.fromJson(data);
    return loginResponseModel;
  }
}
