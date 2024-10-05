import '../../data/repositories/home_repository.dart';
import '../entities/game_home.dart';

class HomeUseCase {
  final HomeRepository repository;

  HomeUseCase(this.repository);

  Future<List<GameHome>> execute() async {
    return await repository.getGames();
  }
}
