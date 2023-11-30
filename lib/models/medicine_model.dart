class MedicineModel {
  bool? success;
  List<MedicineData>? data;
  String? messege;

  MedicineModel({this.success, this.data, this.messege});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <MedicineData>[];
      json['data'].forEach((v) {
        data!.add(new MedicineData.fromJson(v));
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

class MedicineData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  MedicineData({this.id, this.name, this.createdAt, this.updatedAt});

  MedicineData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
