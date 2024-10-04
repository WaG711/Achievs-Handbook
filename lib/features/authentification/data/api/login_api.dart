import 'package:dio/dio.dart';

class LoginApi {
  final Dio dio;

  LoginApi(this.dio);

  Future<String> login(String username, String password) async {
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
