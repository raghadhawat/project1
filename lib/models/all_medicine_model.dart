class AllMedicineModel {
  bool? success;
  List<AllMedicineData>? data;
  String? messege;

  AllMedicineModel({this.success, this.data, this.messege});

  AllMedicineModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <AllMedicineData>[];
      json['data'].forEach((v) {
        data!.add(new AllMedicineData.fromJson(v));
      });
    }
    messege = json['messege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['messege'] = this.messege;
    return data;
  }
}

class AllMedicineData {
  int? id;
  String? scientificName;
  String? tradeName;
  String? companyName;
  String? categoriesName;
  int? quantity;
  int? price;
  String? form;
  String? details;
  String? expirationAt;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;

  AllMedicineData(
      {this.id,
      this.scientificName,
      this.tradeName,
      this.companyName,
      this.categoriesName,
      this.quantity,
      this.price,
      this.form,
      this.details,
      this.expirationAt,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  AllMedicineData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scientificName = json['scientific_name'];
    tradeName = json['trade_name'];
    companyName = json['company_name'];
    categoriesName = json['categories_name'];
    quantity = json['quantity'];
    price = json['price'];
    form = json['form'];
    details = json['details'];
    expirationAt = json['expiration_at'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scientific_name'] = this.scientificName;
    data['trade_name'] = this.tradeName;
    data['company_name'] = this.companyName;
    data['categories_name'] = this.categoriesName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['form'] = this.form;
    data['details'] = this.details;
    data['expiration_at'] = this.expirationAt;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
