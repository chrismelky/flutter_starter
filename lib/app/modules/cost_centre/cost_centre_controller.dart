import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:planrep_mobile/app/core/base_controller.dart';
import 'package:planrep_mobile/app/data/model/cost_centre.dart';
import 'package:planrep_mobile/app/data/provider/cost_centre_api.dart';

class CostCentreController extends BaseController {
  final CostCentreApi api;
  RxList<CostCentre> _costCentres = new RxList([]);

  get costCentres => this._costCentres.value;

  CostCentreController({required this.api});

  @override
  void onReady() async {
    Map<String, dynamic> user = GetStorage().read('PLANREP_USER');
    print(user);
    if (user != null && user['admin_hierarchy_id'] != null) {
      print(user['admin_hierarchy_id']);
      try {
        _costCentres.value = await this
            .api
            .byAdminArea({'admin_hierarchy_id': user['admin_hierarchy_id']});
      } catch (e) {}
    }
    super.onReady();
  }
}
