class EnterReponseModel {
  bool? success;
  Data? data;
  String? messege;

  EnterReponseModel({this.success, this.data, this.messege});

  EnterReponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    messege = json['messege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['messege'] = this.messege;
    return data;
  }
}

class Data {
  String? token;
  String? name;
  String? userName;
  String? userNumber;
  String? address;
  String? email;

  Data(
      {this.token,
      this.name,
      this.userName,
      this.userNumber,
      this.address,
      this.email});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    userName = json['userName'];
    userNumber = json['userNumber'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['userNumber'] = this.userNumber;
    data['address'] = this.address;
    data['email'] = this.email;
    return data;
  }
}
