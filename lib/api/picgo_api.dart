import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/utils/dio_util.dart';
import 'package:flutter_ce_picgo/utils/env_util.dart';
import 'package:yaml/yaml.dart';

import '../models/pubspec.dart';
import '../utils/logger_util.dart';

class PicgoApi {
  /// 获取App最新版本
  static Future<String> getLatestVersion() async {
    Dio dio = Dio();

    // Set headers
    dio.setTimeout();
    dio.options.headers['Accept'] = 'text/html';
    dio.options.connectTimeout = const Duration(
        seconds:
            5); // maybe need more time, but should be care about the page loading
    dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.options.sendTimeout = const Duration(seconds: 5);
    if (env.logEnabled) {
      dio.interceptors.add(LogInterceptor(
          requestBody: false,
          responseBody: true,
          logPrint: (o) => logger.w(o)));
    }

    try {
      var response = await dio.get(
          'https://raw.githubusercontent.com/CrossEvol/flutter_ce_picgo/master/pubspec.yaml');
      var yaml = loadYaml(response.data) as YamlMap;
      var pubSpec = PubSpec.fromJson(jsonDecode(jsonEncode(yaml)));
      return pubSpec.version;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
