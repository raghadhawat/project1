class LastFourModel {
  bool? success;
  List<lastFourData>? data;
  String? messege;

  LastFourModel({this.success, this.data, this.messege});

  LastFourModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <lastFourData>[];
      json['data'].forEach((v) {
        data!.add(new lastFourData.fromJson(v));
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

class lastFourData {
  int? id;
  int? userId;
  String? status;
  String? paidStatus;
  int? totalPrice;
  String? createdAt;
  String? updatedAt;

  lastFourData(
      {this.id,
      this.userId,
      this.status,
      this.paidStatus,
      this.totalPrice,
      this.createdAt,
      this.updatedAt});

  lastFourData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    paidStatus = json['paid_status'];
    totalPrice = json['Total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['paid_status'] = this.paidStatus;
    data['Total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
