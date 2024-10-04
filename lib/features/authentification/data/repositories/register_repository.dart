import '../api/register_api.dart';

class RegisterRepository {
  final RegisterApi registerApi;

  RegisterRepository(this.registerApi);

  Future<String> register(String username, String password) async {
    //return await registerApi.register(username, password);
    return 'g';
  }
}