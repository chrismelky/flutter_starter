import 'package:planrep_mobile/app/data/model/login.dart';
import 'package:planrep_mobile/app/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthApi api;

  AuthRepository(this.api);

  login(LoginModel credentials) {
    return api.login(credentials);
  }
}
