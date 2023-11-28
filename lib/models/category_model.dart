class CategoryModel {
  final String name;
  CategoryModel({required this.name});
  factory CategoryModel.fromJson(json) {
    return CategoryModel(name: json["name"]);
  }
}
