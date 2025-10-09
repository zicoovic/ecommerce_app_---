import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

/// Use case to check if user is logged in
/// Follows Clean Architecture - Domain Layer
class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  Future<bool> call() {
    return repository.isLoggedIn();
  }
}