class LogOutModel {
  bool? success;
  int? data;
  Messege? messege;

  LogOutModel({this.success, this.data, this.messege});

  LogOutModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    messege =
        json['messege'] != null ? new Messege.fromJson(json['messege']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data;
    if (this.messege != null) {
      data['messege'] = this.messege!.toJson();
    }
    return data;
  }
}

class Messege {
  String? message;

  Messege({this.message});

  Messege.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
