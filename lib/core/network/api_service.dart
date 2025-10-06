import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';

// ApiService take the base url  to connect to the API
class ApiService {
  // instance from Dio take the base url from ApiConstants
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  // function to get the data from the API
  Future<Response> get(String url) async {
    return await _dio.get(url);
  }
}
