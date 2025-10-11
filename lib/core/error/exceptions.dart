/// Base exception class
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

/// Server exception (5xx errors)
class ServerException extends AppException {
  ServerException(super.message, {super.statusCode});
}

/// Client exception (4xx errors)
class ClientException extends AppException {
  ClientException(super.message, {super.statusCode});
}

/// Network exception (no internet, timeout, etc)
class NetworkException extends AppException {
  NetworkException(super.message);
}

/// Unauthorized exception (401)
class UnauthorizedException extends AppException {
  UnauthorizedException(super.message) : super(statusCode: 401);
}

/// Not found exception (404)
class NotFoundException extends AppException {
  NotFoundException(super.message) : super(statusCode: 404);
}

/// Validation exception (400 with validation errors)
class ValidationException extends AppException {
  final Map<String, List<String>>? errors;

  ValidationException(super.message, {this.errors}) : super(statusCode: 400);
}

/// Cache exception
class CacheException extends AppException {
  CacheException(super.message);
}