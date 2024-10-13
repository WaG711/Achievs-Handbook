import '../../../../data.dart';
import '../../../home/domain/entities/game_home.dart';
import '../api/favorite_games_api.dart';

class FavoriteGamesRepository {
  final FavoriteGamesApi _gameApi;

  FavoriteGamesRepository(this._gameApi);

  Future<List<GameHome>> getFavoriteGames(String userId) async {
    // final gameModels = await _gameApi.fetchFavoriteGames();
    // return gameModels
    //     .map((model) => Game(model.isFavorite,
    //         gameId: model.gameId,
    //         title: model.title))
    //     .toList();
    return Data.allGames.where((g) => g.isFavorite == true).toList();
  }

  Future<void> removeFavorites(String userId, String gameId) async {
    // final gameModels = await _gameApi.removeFavorites();
  }

  Future<void> addFavorites(String userId, String gameId) async {
    // final gameModels = await _gameApi.addFavorites();
  }
}