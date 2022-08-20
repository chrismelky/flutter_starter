import 'package:get/get.dart';
import 'package:planrep_mobile/app/data/provider/facility_type_api.dart';

import 'facility_type_controller.dart';

class FacilityTypeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FacilityTypeApi());
    Get.put<FacilityTypeController>(FacilityTypeController(api: Get.find()));
  }
}
