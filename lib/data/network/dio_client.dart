import 'package:dio/dio.dart';

import './interceptors/dio_interceptor.dart';
import './Exceptions/api_exception.dart';

class DioClient {
  Dio _dio;

  /* construtor */
  DioClient() {
    _dio = dioInterceptor();
  }

  /* adicionamos o get(tipo de verbo http) */
  /* adicionamos os parametros Map queryParamenters(usado filtros) entre chave == não*/
  Future<dynamic> get(String url,
      {Map<String, dynamic> queryParameters}) async {
    try {
      final Response response =
          await _dio.get(url, queryParameters: queryParameters);

      return response;
    } on DioError catch (e) {
      Future.error({});

      ApiException(e.response);
    }
  }

  /* adicionamos o post(tipo de verbo http) */
  Future<dynamic> post(String url,
      {formData, Map<String, dynamic> queryParameters}) async {
    try {
      final Response response = await _dio.post(url,
          data: formData, queryParameters: queryParameters);

      return response;
    } on DioError catch (e) {
      Future.error({});

      ApiException(e.response);
    }
  }
}
