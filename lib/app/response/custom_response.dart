import 'package:meta/meta.dart';
import 'dart:convert';

CustomResponse customResponseFromJson(Map<String, dynamic> body) =>
    CustomResponse.fromJson(body);

class CustomResponse {
  CustomResponse({
    required this.message,
    required this.success,
    required this.data,
  });

  String? message;
  bool? success;
  dynamic data;

  factory CustomResponse.fromJson(Map<String, dynamic> json) => CustomResponse(
        message: json["message"],
        success: json["success"],
        data: json["data"],
      );
}
