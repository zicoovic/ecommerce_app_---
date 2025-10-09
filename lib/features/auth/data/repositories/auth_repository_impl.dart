import 'package:ecommerce_app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    final authResponse = await authRemoteDataSource.login(request);
    // Save auth response to local storage
    await authLocalDataSource.saveAuthResponse(authResponse);
    return authResponse;
  }

  @override
  Future<void> saveAuthResponse(AuthResponseModel authResponse) {
    return authLocalDataSource.saveAuthResponse(authResponse);
  }

  @override
  Future<AuthResponseModel?> getAuthResponse() {
    return authLocalDataSource.getAuthResponse();
  }

  @override
  Future<bool> isLoggedIn() {
    return authLocalDataSource.isLoggedIn();
  }

  @override
  Future<void> logout() {
    return authLocalDataSource.clearAuthData();
  }

  @override
  Future<String?> getAccessToken() {
    return authLocalDataSource.getAccessToken();
  }
}