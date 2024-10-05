import 'package:dio/dio.dart';

import '../models/game_details_model_api.dart';

class DetailsApi {
  final Dio _dio;

  DetailsApi(this._dio);

  Future<GameDetailsModelApi> fetchGame(String gameId) async {
    final response = await _dio.get('');
    if (response.statusCode == 200) {
      dynamic data = response.data['game'];
      return data.map((json) => GameDetailsModelApi.fromJson(json));
    } else {
      throw Exception('Не удалось загрузить игры');
    }
  }
}
