import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yaml/yaml.dart';

import '../models/pubspec.dart';
import '../utils/logger_util.dart';

class PicgoApi {
  /// 获取App最新版本
  static Future<String> getLatestVersion() async {
    Dio dio = Dio();

    // Set headers
    dio.options.headers['Accept'] = 'text/html';
    // dio.options.headers['Authorization'] = 'Bearer $githubToken';
    // dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    // dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

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
