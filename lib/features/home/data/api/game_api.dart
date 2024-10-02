import 'package:dio/dio.dart';

import '../models/game_model_api.dart';

class GameApi {
  final Dio _dio;

  GameApi(this._dio);

  Future<List<GameModelApi>> fetchGames() async {
    final response = await _dio.get('');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['games'];
      return data.map((json) => GameModelApi.fromJson(json)).toList();
    } else {
      throw Exception('Не удалось загрузить игры');
    }
  }
}
