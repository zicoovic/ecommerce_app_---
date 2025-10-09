import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  /// Check if user is already logged in
  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    try {
      final isLoggedIn = await authRepository.isLoggedIn();
      if (isLoggedIn) {
        final authResponse = await authRepository.getAuthResponse();
        if (authResponse != null) {
          emit(AuthSuccess(authResponse));
        } else {
          emit(AuthInitial());
        }
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Login user
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final request = LoginRequestModel(email: email, password: password);
      final authResponse = await authRepository.login(request);
      emit(AuthSuccess(authResponse));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await authRepository.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}