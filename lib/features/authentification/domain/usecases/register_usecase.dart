import '../../data/repositories/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);

  Future<String> execute(String username, String password) async {
    return await repository.register(username, password);
  }
}