import '../../domain/entities/game_home.dart';
import '../api/home_api.dart';

class HomeRepository {
  final HomeApi _gameApi;

  HomeRepository(this._gameApi);

  final List<GameHome> _allGames = [
    GameHome(false, gameId: '1', title: 'Game 1Game 1Game 1 Game 1Game 1 Game 1Game 1 Game 1 Game 1Game 1Game 1Game 1 Game 1v Game 1',  totalAchievements: 24),
    GameHome(false, gameId: '2', title: 'Game 2', totalAchievements: 54),
    GameHome(false, gameId: '3', title: 'Game 3', totalAchievements: 43),
    GameHome(false, gameId: '4', title: 'Game 4', totalAchievements: 123),
    GameHome(false, gameId: '5', title: 'Game 5', totalAchievements: 87),
    GameHome(false, gameId: '6', title: 'Game 6', totalAchievements: 67),
    GameHome(false, gameId: '7', title: 'Game 7', totalAchievements: 756),
    GameHome(false, gameId: '8', title: 'Game 8', totalAchievements: 234),
    GameHome(false, gameId: '9', title: 'Game 9', totalAchievements: 34),
  ];

  Future<List<GameHome>> getGames() async {
    // final gameModels = await _gameApi.fetchGames();
    // return gameModels
    //     .map((model) => Game(model.isFavorite,
    //         gameId: model.gameId,
    //         title: model.title))
    //     .toList();
    return _allGames;
  }
}
