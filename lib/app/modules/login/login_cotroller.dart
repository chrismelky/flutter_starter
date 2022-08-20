import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:planrep_mobile/app/core/base_controller.dart';
import 'package:planrep_mobile/app/data/model/login.dart';
import 'package:planrep_mobile/app/data/provider/login_provider.dart';
import 'package:planrep_mobile/app/response/erro_response.dart';
import 'package:planrep_mobile/app/response/login_response.dart';
import 'package:planrep_mobile/app/routes/app_pages.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginController extends BaseController {
  final LoginApi repository;
  final FormBuilder fb;
  late FormGroup loginForm;

  LoginController({required this.repository, required this.fb}) {
    this.loginForm = this.fb.group({
      'email': [null, Validators.required, Validators.email],
      'password': [null, Validators.required]
    });
  }

  login() async {
    try {
      var credentials = this.loginForm.value;
      LoginResponse resp = await repository.login(LoginModel(
              email: credentials['email'].toString(),
              password: credentials['password'].toString())
          .toJson());
      GetStorage().write("PLANREP_TOKEN", resp.token);
      GetStorage().write("PLANREP_USER", resp.user);
      Get.offNamed(Routes.HOME);
    } catch (e) {
      this.showError(e as ErrorResponse);
    }
  }
}
