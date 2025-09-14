import 'package:dio/dio.dart';

class ApiClient {
  Dio gettDio() {
    final dio = Dio();
    dio.options.baseUrl = 'https://dummyjson.com/';
    return dio;
  }
}
