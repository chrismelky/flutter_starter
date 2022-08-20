import 'package:get/get.dart';
import 'package:planrep_mobile/app/core/base_controller.dart';
import 'package:planrep_mobile/app/data/model/facility_type.dart';
import 'package:planrep_mobile/app/data/provider/facility_type_api.dart';
import 'package:planrep_mobile/app/response/erro_response.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FacilityTypeDetailController extends BaseController {
  final FormBuilder fb;
  final FormGroup editForm;
  final FacilityTypeApi api;
  FacilityTypeDetailController({required this.fb, required this.api})
      : editForm = fb.group({
          'id': [],
          'name': ['', Validators.required],
          'code': ['', Validators.required],
        });

  @override
  void onInit() {
    super.onInit();
    var params = Get.arguments;
    this.toForm(params['data']);
  }

  fromForm() async {
    var data = this.editForm.value;
    try {
      if (data['id'] != null) {
        await this.api.update(data['id'] as int, data);
        print('called');
        this.onSuccess();
      } else {
        await this.api.create(data);
        this.onSuccess();
      }
    } catch (e) {
      e.printError();
      this.showError(e as ErrorResponse);
    }
  }

  onSuccess() {
    print('called');
    Get.back(result: true);
    this.showSuccess("Facility type create successfully");
  }

  toForm(FacilityType ft) {
    this.editForm.patchValue({'id': ft.id, 'name': ft.name, 'code': ft.code});
  }
}
