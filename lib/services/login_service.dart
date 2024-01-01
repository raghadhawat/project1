import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/enter_model.dart';

class LoginService {
  String basUrl = 'http://192.168.1.36:8000/api';

  Future<EnterReponseModel> loginUser({
    required String phone,
    required String password,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: '$basUrl/Pharmacy/login', body: {
      'userNumber': phone,
      'password': password,
    });

    EnterReponseModel loginResponseModel = EnterReponseModel.fromJson(data);
    return loginResponseModel;
  }
}
