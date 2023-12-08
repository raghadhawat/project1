class SendOrderModel {
  bool? success;

  String? messege;

  SendOrderModel({this.success, this.messege});

  SendOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    messege = json['messege'];
  }
}
