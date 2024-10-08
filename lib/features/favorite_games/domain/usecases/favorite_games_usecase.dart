import '../../../home/domain/entities/game_home.dart';
import '../../data/repositories/favorite_games_repository.dart';

class FavoriteGamesUseCase {
  final FavoriteGamesRepository repository;

  FavoriteGamesUseCase(this.repository);

  Future<List<GameHome>> executeFavorite(String userId) async {
    return await repository.getFavoriteGames(userId);
  }
}