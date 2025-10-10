import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    return await _dio.post(url, data: data);
  }
}
