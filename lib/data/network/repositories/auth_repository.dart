import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../constants/api.dart';
import '../dio_client.dart';
import '../interceptors/dio_interceptor_auth.dart';

class AuthRepository {
  Dio _dio = dioInterceptorAuth();
  // Create storage
  FlutterSecureStorage storage = new FlutterSecureStorage();

  Future auth(String email, String password) async {
    try {
      final response = await _dio.post('auth/token', data: {
        'email': email,
        'password': password,
        'device_name': 'apenas_um_teste'
      });

      print(response.data['token']);

      /* passamos o token para o metodo que vai salvar o token sanctum em nossa app */
      saveToken(response.data['token']);

      return response;
    } on DioError catch (e) {
      print(e.toString());
      print(e.response);
      print(e.response.statusCode);
      print(e.response.data);
    }
  }

  Future register(String name, String email, String password) async {
    try {
      final response = await _dio.post('auth/register', data: {
        'name': name,
        'email': email,
        'password': password,
      });

      print(response.data);

      return response;
    } on DioError catch (e) {
      print(e.toString());
      print(e.response);
      print(e.response.statusCode);
      print(e.response.data);
    }
  }

  Future getMe() async {
    final response = await DioClient().get('url/me');

    print(response);
  }

  /* Aqui vamos salvar o token após a autenticação */
  Future saveToken(String token) async {
    await storage.write(key: 'token_sanctum', value: token);
  }
}
