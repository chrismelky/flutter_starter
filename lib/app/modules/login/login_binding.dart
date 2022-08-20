import 'package:get/get.dart';
import 'package:planrep_mobile/app/data/provider/login_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'login_cotroller.dart';
import 'login_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginApi());
    Get.put<LoginController>(
        LoginController(repository: Get.find(), fb: FormBuilder()));
  }
}
