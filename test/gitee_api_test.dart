import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/models/gitee_content.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  const giteeToken = '<YOUR TOKEN>';
  const repo = 'youmuao/picgo_repo';
  var path = '';

  await initLogger();

  test('github repo api POST request test', () async {
    Dio dio = Dio();

    // Set headers
    // dio.options.headers['Accept'] = 'application/vnd.github+json';
    // dio.options.headers['Authorization'] = 'Bearer $giteeToken';
    // dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    dio.options.headers['Content-Type'] = ' application/json;charset=UTF-8';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    var imageFile = File(
        r'D:\androidStudio\AndroidStudioProjects\flutter_ce_picgo\assets\images\rocket_logo.jpg');
    var fileData = await imageFile.readAsBytes();

    // Set request body
    Map<String, dynamic> requestBody = {
      'message': 'my commit message',
      'content': base64Encode(fileData),
      'access_token': giteeToken
    };

    path = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    // Perform PUT request
    try {
      Response response = await dio.post(
        'https://gitee.com/api/v5/repos/$repo/contents/$path',
        data: requestBody,
        options: Options(contentType: Headers.jsonContentType),
      );
      expect(response.statusCode, equals(201));
      var jsonData = response.data;
      var giteeContent = GiteeContent.fromJson(jsonData['content']);
      logger.i(giteeContent.toJson());
    } catch (e) {
      logger.e(e);
    }
  });

  test('get sha', () async {
    Dio dio = Dio();
    var tempPath = '1715842854200.jpg';

    dio.options.headers['Content-Type'] = ' application/json;charset=UTF-8';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    try {
      var response = await dio.get(
              'https://gitee.com/api/v5/repos/$repo/contents/$tempPath?access_token=$giteeToken');
      expect(200, equals(response.statusCode));
      var jsonData = response.data;
      var giteeContent = GiteeContent.fromJson(jsonData);
      logger.i(giteeContent.toJson());
      logger.w(giteeContent.sha);
    } catch (e) {
      logger.e(e);
    }
  });

  test('github repo api DELETE request test', () async {
    Dio dio = Dio();
    var tempSha = '446008abaa36f66322ebed1de9b4d7217fe3cfce';
    var tempPath = '1715842854200.jpg';

    // Set headers
    dio.options.headers['Content-Type'] = ' application/json;charset=UTF-8';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    // Set request body
    Map<String, dynamic> requestBody = {
      'message': 'my commit message',
      'sha': tempSha
    };

    try {
      var response = await dio.delete(
        'https://gitee.com/api/v5/repos/$repo/contents/$tempPath?access_token=$giteeToken',
        data: requestBody,
        options: Options(contentType: Headers.jsonContentType),
      );
      expect(200, equals(response.statusCode));
      var jsonData = response.data;
      expect(jsonData['content'], isNull);
    } catch (e) {
      logger.e(e);
    }
  });
}
