import 'package:ecommerce_app/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request_model.dart';

abstract class AuthRepository {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<AuthResponseModel> register(RegisterRequestModel request);

  Future<void> saveAuthResponse(AuthResponseModel authResponse);

  Future<AuthResponseModel?> getAuthResponse();

  Future<bool> isLoggedIn();

  Future<void> logout();

  Future<String?> getAccessToken();
}
