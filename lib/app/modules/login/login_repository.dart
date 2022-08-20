import 'package:planrep_mobile/app/data/provider/login_provider.dart';

class LoginRepository {
  final LoginApi api;

  LoginRepository(this.api);

  login(dynamic data) {
    return api.login(data);
  }
}
