import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../network/Exceptions/api_exception.dart';

import '../dio_client.dart';
import '../../../constants/api.dart';
import '../interceptors/dio_interceptor_auth.dart';
import '../../../models/User.dart';

class AuthRepository {
  Dio _dio = dioInterceptorAuth();
  // Create storage
  FlutterSecureStorage storage = new FlutterSecureStorage();

  Future auth(String email, String password) async {
    try {
      String deviceName = await getIdentifyDevice();

      final response = await _dio.post('auth/token', data: {
        'email': email,
        'password': password,
        'device_name': deviceName,
      });

      /* passamos o token para o metodo que vai salvar o token sanctum em nossa app */
      saveToken(response.data['token']);

      return response;
    } on DioError catch (e) {
      Future.error({});

      ApiException(e.response);
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
      Future.error({});

      ApiException(e.response);
      print(e.toString());
      print(e.response);
      print(e.response.statusCode);
      print(e.response.data);
    }
  }

  Future<User> getMe() async {
    final String token = await storage.read(key: 'token_sanctum');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer ' + token;
    }

    try {
      final response = await _dio.get('auth/me');

      return User.fromJson(response.data['data']);
    } on DioError catch (e) {
      Future.error({});

      ApiException(e.response);
    }
  }

  Future logout() async {
    await DioClient().post('auth/logout');

    /* Aqui chamamos o deleteToken para limpar o nosso storage */
    await deleteToken();
  }

  /* Aqui vamos salvar o token após a autenticação */
  Future saveToken(String token) async {
    await storage.write(key: 'token_sanctum', value: token);
  }

  /* Aqui vamos remover o token do storage após fazer o logout */
  Future deleteToken() async {
    await storage.delete(key: 'token_sanctum');
  }

  /* Função que vai verificar OS e model */
  Future<String> getIdentifyDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }
  }
}
