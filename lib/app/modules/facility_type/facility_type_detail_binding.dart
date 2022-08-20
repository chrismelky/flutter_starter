import 'package:get/get.dart';
import 'package:planrep_mobile/app/data/provider/facility_type_api.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'facility_type_detail_controller.dart';

class FacilityTypeDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FacilityTypeApi());
    Get.put<FacilityTypeDetailController>(
        FacilityTypeDetailController(fb: FormBuilder(), api: Get.find()));
  }
}
