import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:planrep_mobile/app/response/erro_response.dart';

abstract class BaseController extends GetxController {
  showError(ErrorResponse error) {
    var title = 'Error-' + error.status.toString();
    var errors;
    if (error.errors != null) {
      errors = '';
      error.errors?.values.forEach((e) {
        errors = errors + e.toString() + '\n';
      });
    }

    var message = errors ?? error.message ?? error.type;
    Get.snackbar(title, message,
        colorText: Colors.white,
        duration: Duration(seconds: 20),
        isDismissible: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        backgroundColor: Colors.yellow[800]);
  }

  showSuccess(String message) {
    Get.snackbar('Success', message,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        colorText: Colors.white,
        borderRadius: 8.0,
        backgroundColor: Colors.grey[800]);
  }
}
