import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final Dio dio = Dio(BaseOptions(contentType: "application/json"))
  ..interceptors.addIf(
    foundation.kDebugMode,
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ),
  );

extension DioInterceptorsExtension on Interceptors {
  void addIf(bool condition, Interceptor interceptor) {
    if (condition) add(interceptor);
  }
}
