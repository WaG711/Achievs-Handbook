import '../../data/repositories/game2_repository.dart';
import '../entities/game2.dart';

class FetchGame {
  final Game2Repository repository;

  FetchGame(this.repository);

  Future<Game2> execute(String gameId) async {
    return await repository.getGame(gameId);
  }
}