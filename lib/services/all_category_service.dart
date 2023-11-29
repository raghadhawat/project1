import 'package:http/http.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/models/category_model.dart';

class AllCategoryService {
  CategoryModel? categoryModel1;
  Future<List<dynamic>> getAllCategory(context) async {
    AuthCubit cubit = AuthCubit.get(context);
    //print(cubit.enterResponseModel!.token);
    Map<String, dynamic> data = await Api().get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/category',
      token: cubit.enterResponseModel!.token,
    );
    List<dynamic> jsonData = data["data"];

    List<dynamic> categoryList = [];

    for (var category in jsonData) {
      CategoryModel categoryModel = CategoryModel.fromJson(category);

      categoryList.add(categoryModel);
    }
    print(jsonData);

    return categoryList;
  }
}
