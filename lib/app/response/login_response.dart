import 'dart:convert';

LoginResponse loginResponseFromJson(Map<String, dynamic> body) =>
    LoginResponse.fromJson(body);

class LoginResponse {
  LoginResponse({
    required this.token,
    required this.user,
  });

  String token;
  Map<String, dynamic> user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        user: json["user"],
      );
}
