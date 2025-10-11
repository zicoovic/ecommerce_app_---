import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';

/// Handles Dio exceptions and converts them to custom exceptions
/// Follows Single Responsibility Principle
class DioExceptionHandler {
  /// Handles DioException and returns appropriate custom exception
  static AppException handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          'Connection timeout. Please check your internet connection and try again.',
        );

      case DioExceptionType.connectionError:
        return NetworkException(
          'No internet connection. Please check your network settings.',
        );

      case DioExceptionType.badResponse:
        return _handleResponseError(error);

      case DioExceptionType.cancel:
        return NetworkException('Request was cancelled.');

      case DioExceptionType.badCertificate:
        return NetworkException(
          'Security error. The connection is not secure.',
        );

      case DioExceptionType.unknown:
        return NetworkException(
          'An unexpected error occurred. Please try again.',
        );
    }
  }

  /// Handles HTTP response errors (4xx, 5xx)
  static AppException _handleResponseError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    switch (statusCode) {
      case 400:
        return _handle400Error(data);
      case 401:
        return UnauthorizedException(
          'Your session has expired. Please login again.',
        );
      case 403:
        return ClientException(
          'You do not have permission to access this resource.',
          statusCode: 403,
        );
      case 404:
        return NotFoundException('The requested resource was not found.');
      case 422:
        return _handleValidationError(data);
      case 500:
        return ServerException(
          'Internal server error. Please try again later.',
          statusCode: 500,
        );
      case 502:
      case 503:
        return ServerException(
          'Service temporarily unavailable. Please try again later.',
          statusCode: statusCode,
        );
      default:
        if (statusCode != null && statusCode >= 500) {
          return ServerException(
            'Server error. Please try again later.',
            statusCode: statusCode,
          );
        }
        return ClientException(
          'An error occurred. Please try again.',
          statusCode: statusCode,
        );
    }
  }

  /// Handles 400 Bad Request errors
  static AppException _handle400Error(dynamic data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'] as String? ??
          data['error'] as String? ??
          'Invalid request. Please check your input.';

      // Check if there are validation errors
      if (data.containsKey('errors') && data['errors'] is Map) {
        final errors = <String, List<String>>{};
        (data['errors'] as Map).forEach((key, value) {
          if (value is List) {
            errors[key.toString()] = value.map((e) => e.toString()).toList();
          }
        });
        return ValidationException(message, errors: errors);
      }

      return ClientException(message, statusCode: 400);
    }

    return ClientException(
      'Invalid request. Please check your input.',
      statusCode: 400,
    );
  }

  /// Handles 422 Validation errors
  static AppException _handleValidationError(dynamic data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'] as String? ??
          'Validation failed. Please check your input.';

      if (data.containsKey('errors') && data['errors'] is Map) {
        final errors = <String, List<String>>{};
        (data['errors'] as Map).forEach((key, value) {
          if (value is List) {
            errors[key.toString()] = value.map((e) => e.toString()).toList();
          }
        });
        return ValidationException(message, errors: errors);
      }

      return ValidationException(message);
    }

    return ValidationException('Validation failed. Please check your input.');
  }
}