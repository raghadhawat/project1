import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/enter_model.dart';

class LoginService {
  Future<EnterReponseModel> loginUser({
    required String phone,
    required String password,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: 'http://10.0.2.2:8000/api/Pharmacy/login', body: {
      'userNumber': phone,
      'password': password,
    });

    EnterReponseModel loginResponseModel = EnterReponseModel.fromJson(data);
    return loginResponseModel;
  }
}
