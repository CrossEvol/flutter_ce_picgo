import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/models/gitee_content.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  const giteeToken = '5f29545bd0cab05994cacc62b3955de7';
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
    var tempPath = '1715842582381.jpg';

    dio.options.headers['Content-Type'] = ' application/json;charset=UTF-8';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    var response = await dio.get(
        'https://gitee.com/api/v5/repos/$repo/contents/$tempPath?access_token=$giteeToken');
    expect(200, response.statusCode);
    var jsonData = response.data;
    var giteeContent = GiteeContent.fromJson(jsonData);
    logger.i(giteeContent.toJson());
    logger.w(giteeContent.sha);
  });
}
