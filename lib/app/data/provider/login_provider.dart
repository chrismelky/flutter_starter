import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:planrep_mobile/app/data/provider/base_provider.dart';
import 'package:planrep_mobile/app/response/custom_response.dart';
import 'package:planrep_mobile/app/response/login_response.dart';

class LoginApi extends BaseProvider {
  Future<LoginResponse> login(dynamic login) async {
    try {
      Response resp = await post("/api/authenticate", login);
      print(resp.body);
      print(resp.body.runtimeType);
      return loginResponseFromJson(customResponseFromJson(resp.body).data);
    } catch (e) {
      throw (e);
    }
  }
}
