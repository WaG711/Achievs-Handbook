import 'package:dio/dio.dart';

import '../models/game_home_model_api.dart';

class HomeApi {
  final Dio _dio;

  HomeApi(this._dio);

  Future<List<GameHomeModelApi>> fetchGames(String userId) async {
    final response = await _dio.get('');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['games'];
      return data.map((json) => GameHomeModelApi.fromJson(json)).toList();
    } else {
      throw Exception('Не удалось загрузить игры');
    }
  }
}
