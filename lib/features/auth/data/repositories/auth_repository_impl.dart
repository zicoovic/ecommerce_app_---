import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<AuthResponseModel> login(LoginRequestModel request) {
    return authRemoteDataSource.login(request);
  }
}
