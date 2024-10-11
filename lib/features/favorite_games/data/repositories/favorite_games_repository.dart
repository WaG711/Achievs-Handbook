import '../../../home/domain/entities/game_home.dart';
import '../api/favorite_games_api.dart';

class FavoriteGamesRepository {
  final FavoriteGamesApi _gameApi;

  FavoriteGamesRepository(this._gameApi);

  final List<GameHome> _allGames = [
    GameHome(gameId: '1', title: 'Game 1Game 1Game 1 Game 1Game 1 Game 1Game 1 Game 1 Game 1Game 1Game 1Game 1 Game 1v Game 1', totalAchievements: 24, isFavorite: true),
    GameHome(gameId: '2', title: 'Game 2', totalAchievements: 54, isFavorite: false),
    GameHome(gameId: '3', title: 'Game 3', totalAchievements: 43, isFavorite: false),
    GameHome(gameId: '4', title: 'Game 4', totalAchievements: 123, isFavorite: false),
    GameHome(gameId: '5', title: 'Game 5', totalAchievements: 87, isFavorite: true),
    GameHome(gameId: '6', title: 'Game 6', totalAchievements: 67, isFavorite: false),
    GameHome(gameId: '7', title: 'Game 7', totalAchievements: 756, isFavorite: false),
    GameHome(gameId: '8', title: 'Game 8', totalAchievements: 234, isFavorite: false),
    GameHome(gameId: '9', title: 'Game 9', totalAchievements: 34, isFavorite: false),
  ];

  Future<List<GameHome>> getFavoriteGames(String userId) async {
    // final gameModels = await _gameApi.fetchFavoriteGames();
    // return gameModels
    //     .map((model) => Game(model.isFavorite,
    //         gameId: model.gameId,
    //         title: model.title))
    //     .toList();
    return _allGames.where((g) => g.isFavorite == true).toList();
  }

  Future<void> removeFavorites(String userId, String gameId) async {
    // final gameModels = await _gameApi.removeFavorites();
  }

  Future<void> addFavorites(String userId, String gameId) async {
    // final gameModels = await _gameApi.addFavorites();
  }
}