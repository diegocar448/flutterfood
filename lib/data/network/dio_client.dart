import 'package:dio/dio.dart';

import './interceptors/dio_interceptor.dart';

class DioClient {
  Dio _dio;

  /* construtor */
  DioClient() {
    _dio = dioInterceptor();
  }

  /* adicionamos o get(tipo de verbo http) */
  Future<dynamic> get(String url, Map<String, dynamic> queryParameters) async {
    try {
      final Response response =
          await _dio.get(url, queryParameters: queryParameters);
      print(response);

      return response;
    } catch (e) {
      print(e.toString());

      throw e;
    }
  }

  /* adicionamos o post(tipo de verbo http) */
  Future<dynamic> post(
      String url, formData, Map<String, dynamic> queryParameters) async {
    try {
      final Response response = await _dio.post(url,
          data: formData, queryParameters: queryParameters);
      print(response);

      return response;
    } catch (e) {
      print(e.toString());

      throw e;
    }
  }
}
