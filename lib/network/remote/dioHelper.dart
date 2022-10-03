import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static late Dio dio;
// https://newsapi.org/
// v2/everything?
// q=tesla&from=2022-08-22&sortBy=publishedAt&
// apiKey=7afa4284413348caa946cf4a421b0217

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,
          connectTimeout: 10000000000,
          receiveTimeout: 10000000000),
    );
  }

  static Future<Response> getData(
      {required String url, required dynamic query}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
