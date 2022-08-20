import 'dart:async';

import 'package:get/get.dart';
import 'package:planrep_mobile/app/core/base_controller.dart';
import 'package:planrep_mobile/app/data/model/facility_type.dart';
import 'package:planrep_mobile/app/data/provider/facility_type_api.dart';
import 'package:planrep_mobile/app/response/erro_response.dart';
import 'package:planrep_mobile/app/routes/app_pages.dart';

class FacilityTypeController extends BaseController {
// final FacilityTypeRepository repository;
  final FacilityTypeApi api;
  RxBool showSearch = false.obs;
  RxList<FacilityType> _facilityTypes = new RxList([]);
  get facilityTypes => this._facilityTypes.value;

  Timer? _debounce;
  String? _search;

  FacilityTypeController({required this.api});
  @override
  onInit() {
    load();
    super.onInit();
  }

  load() async {
    try {
      var query =
          _search != null && _search!.length > 0 ? {'name': _search} : {};
      print({'per_page': '10', 'page': '1', ...query});
      this._facilityTypes.value =
          await this.api.all({'per_page': '10', 'page': '1', ...query});
    } catch (e) {
      e.printError();
      this.showError(e as ErrorResponse);
    }
  }

  onSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 900), () {
      _search = query;
      load();
    });
  }

  toggleSearch() {
    this.showSearch.value = !this.showSearch.value;
  }

  clearSearch() {
    _search = null;
    showSearch.value = false;
    load();
  }

  createOrEdit(ft) {
    ft = ft != null ? ft : FacilityType();
    Get.toNamed(Routes.FACILITY_TYPE_DETAIL, arguments: {'data': ft})
        ?.then((result) {
      if (result) {
        this.load();
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
