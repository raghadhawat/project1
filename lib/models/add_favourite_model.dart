class AddFavourite {
  bool? success;

  String? messege;

  AddFavourite({this.success, this.messege});

  AddFavourite.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['success'] = this.success;

      data['messege'] = this.messege;
      return data;
    }
  }
}
