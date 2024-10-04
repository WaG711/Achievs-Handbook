import 'package:guide_achievements/features/authentification/data/api/login_api.dart';

class LoginRepository {
  final LoginApi loginApi;

  LoginRepository(this.loginApi);

  Future<String> login(String username, String password) async {
    //return await _loginApi.login(username, password);
    return 'g';
  }
}
