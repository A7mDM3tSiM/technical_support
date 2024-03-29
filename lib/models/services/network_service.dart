import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

enum Method { get, post }

class NetworkService {
  /// dio is not used for now but it is left for future porposes
  /// ignore: unused_field
  static late Dio _dio;
  static const String _baseUrl = 'http://192.168.1.23/hesk-api/index.php?url=';

  /// initlize the dio services
  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );
  }

  static Future<http.Response> get({
    required String path,
    dynamic params,
  }) async {
    try {
      final response = await http.get(
        Uri(
          path: _baseUrl,
          queryParameters: params,
        ),
      );
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }

  static Future<http.Response> post({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(path),
        body: body,
      );
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
