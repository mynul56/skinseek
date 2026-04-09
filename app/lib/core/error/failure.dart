import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class ApiFailure extends Failure {
  const ApiFailure(super.message, {super.statusCode});

  factory ApiFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiFailure('Connection timeout');
      case DioExceptionType.sendTimeout:
        return const ApiFailure('Send timeout');
      case DioExceptionType.receiveTimeout:
        return const ApiFailure('Receive timeout');
      case DioExceptionType.badResponse:
        final message = error.response?.data?['message'] ?? 'Unexpected error';
        return ApiFailure(message, statusCode: error.response?.statusCode);
      case DioExceptionType.cancel:
        return const ApiFailure('Request cancelled');
      case DioExceptionType.connectionError:
        return const ApiFailure('No internet connection');
      default:
        return const ApiFailure('Something went wrong');
    }
  }
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class SubscriptionFailure extends Failure {
  const SubscriptionFailure(super.message);
}
