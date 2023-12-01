class MedicineModel {
  bool? success;
  List<MedicineData>? data;
  String? messege;

  MedicineModel({this.success, this.data, this.messege});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'][1] != null) {
      data = <MedicineData>[];
      json['data'][1].forEach((v) {
        data!.add(new MedicineData.fromJson(v));
      });
    }
    messege = json['messege'];
  }
}

class MedicineData {
  int? id;
  String? scientificName;
  String? tradeName;
  String? companyName;
  String? photo;
  String? categoriesName;
  String? form;
  int? quantity;
  int? price;
  String? expirationAt;
  String? details;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;

  MedicineData({
    this.id,
    this.scientificName,
    this.tradeName,
    this.companyName,
    this.photo,
    this.categoriesName,
    this.form,
    this.quantity,
    this.price,
    this.expirationAt,
    this.details,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  MedicineData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scientificName = json['scientific_name'];
    tradeName = json['trade_name'];
    companyName = json['company_name'];
    photo = json['photo'];
    categoriesName = json['categories_name'];
    form = json['form'];
    quantity = json['quantity'];
    price = json['price'];
    expirationAt = json['expiration_at'];
    details = json['details'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
