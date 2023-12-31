class OrderStatusModel {
  bool? success;
  List<OrderStatusData>? data;
  String? messege;

  OrderStatusModel({this.success, this.data, this.messege});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <OrderStatusData>[];
      json['data'].forEach((v) {
        data!.add(new OrderStatusData.fromJson(v));
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

class OrderStatusData {
  int? id;
  int? userId;
  String? status;
  String? paidStatus;
  String? createdAt;
  int? Total_price;

  OrderStatusData(
      {this.id,
      this.userId,
      this.status,
      this.paidStatus,
      this.createdAt,
      this.Total_price});

  OrderStatusData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    paidStatus = json['paid_status'];
    createdAt = json['created_at'];
    Total_price = json['Total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['paid_status'] = this.paidStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
