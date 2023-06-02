import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response<dynamic>> getData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await dio!.get(url, queryParameters: data);
  }
}
