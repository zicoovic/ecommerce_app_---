import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/api_service.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';

class AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSource({required this.apiService});

  Future<UserModel> login(LoginRequestModel request) async {
    final response = await apiService.post(
      ApiConstants.login,
      data: request.toJson(),
    );
    return UserModel.fromJson(response.data);
  }
}
