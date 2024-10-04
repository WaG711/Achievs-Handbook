import '../../data/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<String> execute(String username, String password) async {
    final response = await repository.login(username, password);
    return response;
  }
}
