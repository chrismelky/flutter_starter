import 'package:get/get.dart';
import 'package:planrep_mobile/app/data/provider/cost_centre_api.dart';
import 'package:planrep_mobile/app/modules/cost_centre/cost_centre_controller.dart';

class CostCentreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CostCentreApi());
    Get.put<CostCentreController>(CostCentreController(api: Get.find()));
  }
}
