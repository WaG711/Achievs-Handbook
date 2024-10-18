import 'package:dio/dio.dart';

import '../models/game_details_model_api.dart';

class DetailsApi {
  final Dio dio;

  DetailsApi(this.dio);

  Future<GameDetailsModelApi> fetchGame(String userId, String gameId) async {
    final response = await dio.get('',
        data: gameId, options: Options(headers: {'userId': userId}));
    if (response.statusCode == 200) {
      dynamic data = response.data['game'];
      return data.map((json) => GameDetailsModelApi.fromJson(json));
    } else {
      throw Exception('Не удалось загрузить игру');
    }
  }
}
