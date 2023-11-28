import 'package:pharma_track/helper/api.dart';
import 'package:pharma_track/main.dart';
import 'package:pharma_track/models/category_model.dart';

class AllCategoryService {
  Future<List<CategoryModel>> getAllCategory() async {
    Map<String, dynamic> data = await Api().get(
      url: 'http://10.0.2.2:8000/api/Pharmacy/category',
    );
    List<dynamic> jsonData = data["data"];
    List<CategoryModel> categoryList = [];

    for (var category in jsonData) {
      CategoryModel categoryModel = CategoryModel.fromJson(category);
      categoryList.add(categoryModel);
    }
    return categoryList;
  }
}
