import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../constants/api.dart';

final storage = new FlutterSecureStorage();
Dio dio = new Dio();

Dio dioInterceptor() {
  // Set default configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT; //5s
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      /* toda vez que fizer uma requisição armazenamos o nosso header */
      dio.options.headers['Accept'] = 'application/json';

      final String token = await storage.read(key: 'token_sanctum');

      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer ' + token;
      }

      return options;
    },
  ));

  return dio;
}
