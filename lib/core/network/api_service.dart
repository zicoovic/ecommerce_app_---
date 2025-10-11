import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/error_interceptor.dart';

class ApiService {
  final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            headers: {'Accept': 'application/json'},
          ),
        )
        ..interceptors.addAll([
          ErrorInterceptor(),
          LogInterceptor(
            requestBody: true,
            responseBody: true,
            error: true,
            requestHeader: true,
            responseHeader: false,
          ),
        ]);

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    return await _dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
