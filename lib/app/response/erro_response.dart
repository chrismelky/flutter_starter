import 'package:get/get_connect/http/src/status/http_status.dart';

class ErrorResponse {
  ErrorResponse({
    required this.status,
    required this.type,
    required this.url,
    this.message,
    this.errors,
  });

  String type;
  String? message;
  Map<String, dynamic>? errors;
  int status;
  String url;

  @override
  String toString() {
    return this.errors.toString();
  }
}
