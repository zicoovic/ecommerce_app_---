import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

/// Use case to logout user
/// Clears all auth data from local storage
/// Follows Clean Architecture - Domain Layer
class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}