import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:planrep_mobile/app/data/model/login.dart';
import 'package:planrep_mobile/app/data/provider/base_provider.dart';
import 'package:planrep_mobile/app/response/login_response.dart';

class AuthApi extends BaseProvider {
  Future<LoginResponse> login(dynamic login) async {
    try {
      Response resp = await post("/api/authenticate", login);
      print(resp.body);
      print(resp.body.runtimeType);
      return loginResponseFromJson(resp.body);
    } catch (e) {
      throw (e);
    }
  }
}
