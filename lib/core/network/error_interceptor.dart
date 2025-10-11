import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/dio_exception_handler.dart';

/// Interceptor that handles errors globally
/// Follows Single Responsibility Principle
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Convert DioException to custom exception
    final exception = DioExceptionHandler.handleDioException(err);

    // Create new DioException with custom message
    final newError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: exception,
      message: exception.message,
    );

    handler.next(newError);
  }
}