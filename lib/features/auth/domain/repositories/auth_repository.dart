import 'package:ecommerce_app/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';

abstract class AuthRepository {
  Future<AuthResponseModel> login(LoginRequestModel request);
}
