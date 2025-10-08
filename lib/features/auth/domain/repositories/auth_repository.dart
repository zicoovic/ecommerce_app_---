import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(LoginRequestModel request);
}
