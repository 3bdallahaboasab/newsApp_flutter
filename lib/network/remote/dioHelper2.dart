import 'package:dio/dio.dart';

class DioHelper2 {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> getData(
      {required String url, required dynamic query}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {required String url, dynamic query, dynamic data}) async {
    return dio.post(url, queryParameters: query, data: data);
  }
}
