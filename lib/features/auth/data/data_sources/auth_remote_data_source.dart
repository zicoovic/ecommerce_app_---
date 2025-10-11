import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/error/dio_exception_handler.dart';
import 'package:ecommerce_app/core/network/api_service.dart';
import 'package:ecommerce_app/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request_model.dart';

class AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSource({required this.apiService});

  Future<AuthResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await apiService.post(
        ApiConstants.login,
        data: request.toJson(),
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleDioException(e);
    }
  }

  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    try {
      final response = await apiService.post(
        ApiConstants.register,
        data: request.toJson(),
      );
      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handleDioException(e);
    }
  }
}
