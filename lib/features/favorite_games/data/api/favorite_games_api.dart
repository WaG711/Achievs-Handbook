import 'package:dio/dio.dart';

import '../../../home/data/models/game_home_model_api.dart';

class FavoriteGamesApi {
  final Dio _dio;

  FavoriteGamesApi(this._dio);

  Future<List<GameHomeModelApi>> fetchFavoriteGames(String userId) async {
    final response = await _dio.get('');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['games'];
      return data.map((json) => GameHomeModelApi.fromJson(json)).toList();
    } else {
      throw Exception('Не удалось загрузить игры');
    }
  }
}