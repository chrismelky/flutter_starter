import 'package:get/get.dart';
import 'package:planrep_mobile/app/data/provider/auth_provider.dart';
import 'package:planrep_mobile/app/data/repository/auth_repository.dart';

import 'auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository(AuthApi()));
    Get.put<AuthController>(AuthController(repository: Get.find()));
  }
}
