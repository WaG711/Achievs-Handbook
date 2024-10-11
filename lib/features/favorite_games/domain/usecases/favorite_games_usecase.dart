import '../../../home/domain/entities/game_home.dart';
import '../../data/repositories/favorite_games_repository.dart';

class FavoriteGamesUseCase {
  final FavoriteGamesRepository repository;

  FavoriteGamesUseCase(this.repository);

  Future<List<GameHome>> executeFavorite(String userId) async {
    return await repository.getFavoriteGames(userId);
  }

  Future<void> addFavorites(String userId, String gameId) async {
    return await repository.addFavorites(userId, gameId);
  }

  Future<void> removeFavorites(String userId, String gameId) async {
    return await repository.removeFavorites(userId, gameId);
  }
}