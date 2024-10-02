import '../../data/repositories/game_repository.dart';
import '../entities/game.dart';

class FetchGames {
  final GameRepository repository;

  FetchGames(this.repository);

  Future<List<Game>> execute() async {
    return await repository.getGames();
  }
}