import '../../../../data.dart';
import '../../domain/entities/game_home.dart';
import '../api/home_api.dart';

class HomeRepository {
  final HomeApi _gameApi;

  HomeRepository(this._gameApi);

  Future<List<GameHome>> getGames(String userId) async {
    // final gameModels = await _gameApi.fetchGames();
    // return gameModels
    //     .map((model) => Game(model.isFavorite,
    //         gameId: model.gameId,
    //         title: model.title))
    //     .toList();
    return Data.allGames;
  }
}
