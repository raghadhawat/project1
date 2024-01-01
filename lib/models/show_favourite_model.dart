class ShowFavouritreModel {
  bool? success;
  List<ShowFavouritreData>? data;
  String? messege;

  ShowFavouritreModel({this.success, this.data, this.messege});

  ShowFavouritreModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <ShowFavouritreData>[];
      json['data'].forEach((v) {
        data!.add(new ShowFavouritreData.fromJson(v));
      });
    }
    messege = json['messege'];
  }
}

class ShowFavouritreData {
  int? id;
  String? scientificName;
  String? tradeName;
  String? companyName;
  Null photo;
  String? categoriesName;
  String? form;
  int? quantity;
  int? price;
  String? expirationAt;
  String? details;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;

  ShowFavouritreData(
      {this.id,
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
      this.updatedAt});

  ShowFavouritreData.fromJson(json) {
    id = json[0]['id'];
    scientificName = json[0]['scientific_name'];
    tradeName = json[0]['trade_name'];
    companyName = json[0]['company_name'];
    photo = json[0]['photo'];
    categoriesName = json[0]['categories_name'];
    form = json[0]['form'];
    quantity = json[0]['quantity'];
    price = json[0]['price'];
    expirationAt = json[0]['expiration_at'];
    details = json[0]['details'];
    deletedAt = json[0]['deleted_at'];
    createdAt = json[0]['created_at'];
    updatedAt = json[0]['updated_at'];
  }
}
