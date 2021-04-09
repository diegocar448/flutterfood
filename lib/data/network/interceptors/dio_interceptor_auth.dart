import 'package:dio/dio.dart';
import '../../../constants/api.dart';

/* Vamos centralizar esse interceptor para register e authg */

Dio dioInterceptorAuth() {
  Dio dio = new Dio();

  // Set default configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT; //5s
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;

  /* Aqui vamos tratar para as validações do laravel o response HEADERs*/
  dio.options.headers['Accept'] = 'application/json';

  return dio;
}
