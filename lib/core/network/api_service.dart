import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'Accept': 'application/json',
        'Cookie':
            'access_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlYWVlMTNlMS01MDZkLTRjNTUtMDA3Yy0wOGRlMDQxODkwZmEiLCJqdGkiOiI0NDBjZTEwNS1iM2Q2LTQzNjAtODhlMS00M2U0ODRlNDRiMGMiLCJlbWFpbCI6ImFiZGVscmhtYW56YWthcmlhcWFAZ21haWwuY29tIiwibmFtZSI6ImFiZG8gemljbyIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc2MDAzMDY4NywiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.bU6DUsEX-cQmRZj_FDzaziuVqAyGIU1-9yVUpoiIioM',
      },
    ),
  );

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    return await _dio.post(url, data: data);
  }
}
