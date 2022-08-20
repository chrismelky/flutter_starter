import 'package:get/get.dart';
import 'package:planrep_mobile/app/data/provider/home_api.dart';
import 'package:planrep_mobile/app/data/repository/home_repository.dart';
import 'package:planrep_mobile/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeApi());
    Get.lazyPut(() => HomeRepository(Get.find()));
    Get.put<HomeController>(HomeController(repository: Get.find()));
  }
}
