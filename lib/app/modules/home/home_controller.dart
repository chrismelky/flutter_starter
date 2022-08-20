import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:planrep_mobile/app/core/base_controller.dart';
import 'package:planrep_mobile/app/data/repository/home_repository.dart';
import 'package:planrep_mobile/app/response/erro_response.dart';

class HomeController extends BaseController {
  final HomeRepository repository;
  HomeController({required this.repository});

  final _title = ''.obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;

  @override
  void onInit() {
    print('home on int called');
    Map<String, dynamic> user = GetStorage().read('PLANREP_USER');
    print(user);
    super.onInit();
  }
}
