import '../../domain/entities/game.dart';
import '../api/game_api.dart';

class GameRepository {
  final GameApi _gameApi;

  GameRepository(this._gameApi);

  final List<Game> _allGames = [
    Game(false, gameId: '1', title: 'Game 1Game 1Game 1 Game 1Game 1 Game 1Game 1 Game 1 Game 1Game 1Game 1Game 1 Game 1v Game 1',  totalAchievements: 24),
    Game(false, gameId: '2', title: 'Game 2', totalAchievements: 54),
    Game(false, gameId: '3', title: 'Game 3', totalAchievements: 43),
    Game(false, gameId: '4', title: 'Game 4', totalAchievements: 123),
    Game(false, gameId: '5', title: 'Game 5', totalAchievements: 87),
    Game(false, gameId: '6', title: 'Game 6', totalAchievements: 67),
    Game(false, gameId: '7', title: 'Game 7', totalAchievements: 756),
    Game(false, gameId: '8', title: 'Game 8', totalAchievements: 234),
    Game(false, gameId: '9', title: 'Game 9', totalAchievements: 34),
  ];

  Future<List<Game>> getGames() async {
    // final gameModels = await _gameApi.fetchGames();
    // return gameModels
    //     .map((model) => Game(model.isFavorite,
    //         gameId: model.gameId,
    //         title: model.title))
    //     .toList();
    return _allGames;
  }
}
