import 'package:dio/dio.dart';
import 'package:movies_/data/constant/constant.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getdata({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String? lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      'lang': lang,
    };
    return await dio.get(url, queryParameters: query);
  }
}
