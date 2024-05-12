import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';

late Dio dio;

Future<void> setupDio() async {
  dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30000),
      receiveTimeout: const Duration(seconds: 30000),
      sendTimeout: const Duration(seconds: 30000)));

  /// Log Interceptor
  if (!kDebugMode) {
    /// Log
    dio.interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, logPrint: (o) => logger.w(o)));
  }
}
