import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:planrep_mobile/app/response/erro_response.dart';

const baseUrl = 'http://10.0.2.2:8000';

abstract class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    print("base provide init");
    httpClient.addRequestModifier<void>((request) {
      String token = GetStorage().read("PLANREP_TOKEN");

      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = 'Bearer ' + token;
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      print(response.statusCode);
      print(response.statusText);
      if (response.statusCode == HttpStatus.unauthorized &&
          !request.url.path.contains('/authenticate')) {
        Get.offNamed("/login");
        return Future.error(new ErrorResponse(
            status: response.statusCode!,
            type: response.statusText!,
            url: request.url.path));
      } else if (response.statusCode != HttpStatus.ok) {
        return Future.error(new ErrorResponse(
            status: response.statusCode!,
            url: request.url.path,
            type: response.statusText!,
            message: (response.body as dynamic)['message'],
            errors: (response.body as dynamic)['errors']));
      } else {
        return response;
      }
    });
    super.onInit();
  }
}
