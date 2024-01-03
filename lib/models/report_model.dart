class ReportModel {
  bool? success;
  List<ReportData>? data;
  List<FinalPriceData>? data1;
  String? messege;

  ReportModel({this.success, this.data, this.messege});

  ReportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'][0] != null) {
      data = <ReportData>[];
      json['data'][0].forEach((v) {
        data!.add(new ReportData.fromJson(v));
      });
    }
    if (json['data'][1] != null) {
      data1 = <FinalPriceData>[];
      json['data'][1].forEach((v) {
        data1!.add(new FinalPriceData.fromJson(v));
      });
    }
    messege = json['messege'];
  }
}

class ReportData {
  int? id;
  int? userId;
  String? status;
  String? paidStatus;
  int? totalPrice;
  String? createdAt;
  String? updatedAt;

  ReportData(
      {this.id,
      this.userId,
      this.status,
      this.paidStatus,
      this.totalPrice,
      this.createdAt,
      this.updatedAt});

  ReportData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    paidStatus = json['paid_status'];
    totalPrice = json['Total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class FinalPriceData {
  dynamic? totalSales;

  FinalPriceData({this.totalSales});

  FinalPriceData.fromJson(Map<String, dynamic> json) {
    totalSales = json['total_sales'];
  }
}
