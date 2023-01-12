import 'package:dio/dio.dart';

enum Method { get, post }

class NetworkService {
  static late Dio _dio;
  static const String _baseUrl = 'http://apibaseurl.com/api/v1';

  /// initlize the dio services
  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );
  }

  static Future<Response> get({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: params);
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }

  static Future<Response> post({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
