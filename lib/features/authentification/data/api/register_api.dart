import 'package:dio/dio.dart';

class RegisterApi {
  final Dio dio;

  RegisterApi(this.dio);

  Future<String> register(String username, String password) async {
    final response = await dio.post(
      '',
      data: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return response.data['userId'];
    } else {
      throw Exception('Ошибка авторизации');
    }
  }
}
