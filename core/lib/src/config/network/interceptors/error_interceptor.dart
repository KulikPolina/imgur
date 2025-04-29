part of '../dio_config.dart';

class ErrorInterceptor extends Interceptor {
  final Dio dio;

  ErrorInterceptor(this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    switch (err.type) {
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.sendTimeout:
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            break;
          case 404:
            break;
          case 500:
            break;
        }
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        break;
    }

    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }
    final Response<dynamic> response =
        err.response ?? Response<dynamic>(requestOptions: err.requestOptions);
    return handler.resolve(response);
  }

  Future<void> handle401Error(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    return handler.next(error);
  }
}
