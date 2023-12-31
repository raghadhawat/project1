class OrderModel {
  bool? success;
  List<OrderData>? data;
  String? messege;

  OrderModel({this.success, this.data, this.messege});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'][1] != null) {
      data = <OrderData>[];
      json['data'][1].forEach((v) {
        data!.add(new OrderData.fromJson(v));
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

class OrderData {
  int? id;
  int? cartId;
  int? quantity;
  String? medicinesName;

  OrderData({this.id, this.cartId, this.quantity, this.medicinesName});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    quantity = json['quantity'];
    medicinesName = json['medicines_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cart_id'] = this.cartId;
    data['quantity'] = this.quantity;
    data['medicines_name'] = this.medicinesName;
    return data;
  }
}
