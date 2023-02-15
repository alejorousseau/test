import 'package:dio/dio.dart';
import 'package:technical_test/configs/env.dart';


class DioClient {

  static Dio build() {

    final client = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl(),
        connectTimeout: const Duration(milliseconds: 25000),
        receiveTimeout: const Duration(milliseconds: 25000),
      )
    );
  
    client.interceptors.add( LogInterceptor() );

    return client;
  }
}