class EnterResponseModel {
  final String token;
  final bool error;
  EnterResponseModel({
    required this.token,
    required this.error,
  });
  factory EnterResponseModel.fromJson(json) {
    return EnterResponseModel(
      token: json['data']['token'],
      error: json['success'],
    );
  }
}
