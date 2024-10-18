import 'package:dio/dio.dart';

import '../../../home/data/models/game_home_model_api.dart';

class FavoriteGamesApi {
  final Dio dio;

  FavoriteGamesApi(this.dio);

  Future<List<GameHomeModelApi>> fetchFavoriteGames(String userId) async {
    final response = await dio.get('', options: Options(headers: {'userId': userId}));
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['favoriteGames'];
      return data.map((json) => GameHomeModelApi.fromJson(json)).toList();
    } else {
      throw Exception('Не удалось загрузить игры');
    }
  }

  Future<void> addFavorites(String userId, String gameId) async {
    final response = await dio.post('',
        data: gameId, options: Options(headers: {'userId': userId}));
    if (response.statusCode == 200) {
    } else {
      throw Exception('Не удалось добавить в избранное');
    }
  }

  Future<void> removeFavorites(String userId, String gameId) async {
    final response = await dio.post('',
        data: gameId, options: Options(headers: {'userId': userId}));
    if (response.statusCode == 200) {
    } else {
      throw Exception('Не удалось убрать из избранного');
    }
  }
}
