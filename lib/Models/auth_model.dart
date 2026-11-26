class AuthModel {
  final String message;
  final bool statusCode;

  new({required this.message, required this.statusCode});
  factory AuthModel.fromjson(Map json) {
    return AuthModel(message: json["message"], statusCode: json["statusCode"]);
  }
}
