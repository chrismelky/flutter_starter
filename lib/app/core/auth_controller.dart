import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:planrep_mobile/app/data/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  AuthController({required this.repository});

  RxBool? _isAuthenticated;
  set isAuthenticated(value) => this._isAuthenticated?.value = value;
  get isAuthenticated => this._isAuthenticated?.value;

  @override
  void onReady() async {
    String token = GetStorage().read("PLANREP_TOKEN");
    if (null != token) {
      Get.offNamed('/home');
    } else {
      Get.offNamed('/login');
    }
    super.onReady();
  }
}
