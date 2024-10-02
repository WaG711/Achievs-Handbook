import 'package:dio/dio.dart';

import '../models/game2_model_api.dart';

class Game2Api {
  final Dio _dio;

  Game2Api(this._dio);

  Future<Game2ModelApi> fetchGame(String gameId) async {
    final response = await _dio.get('');
    if (response.statusCode == 200) {
      dynamic data = response.data['game'];
      return data.map((json) => Game2ModelApi.fromJson(json));
    } else {
      throw Exception('Не удалось загрузить игры');
    }
  }
}