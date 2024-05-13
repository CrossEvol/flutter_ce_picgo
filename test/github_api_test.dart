import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/models/github_content.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  const githubToken = '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';
  const repo = 'CrossEvol/picgo-repo';
  var path = '';
  var sha = '';

  test('time', () {
    print(DateTime.now().toString());
    print(DateTime.now().millisecondsSinceEpoch);
    print(DateTime.now().millisecond);
    print(DateTime.now().microsecondsSinceEpoch);
    print(DateTime.now().microsecond);
  });

  test('github repo put request test', () async {
    await initLogger();

    Dio dio = Dio();

    // Set headers
    dio.options.headers['Accept'] = 'application/vnd.github+json';
    dio.options.headers['Authorization'] = 'Bearer $githubToken';
    dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    var imageFile = File(
        r'D:\androidStudio\AndroidStudioProjects\flutter_ce_picgo\assets\images\icon_empty_album.png');
    var fileData = await imageFile.readAsBytes();

    // Set request body
    Map<String, dynamic> requestBody = {
      'message': 'my commit message',
      'content': base64Encode(fileData),
    };

    path = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    // Perform PUT request
    try {
      Response response = await dio.put(
        'https://api.github.com/repos/$repo/contents/$path',
        data: requestBody,
        options: Options(contentType: Headers.jsonContentType),
      );
      expect(response.statusCode, equals(201));
      var jsonData = response.data;
      var githubContent = GithubContent.fromJson(jsonData['content']);
      logger.i(githubContent.toJson());
      sha = githubContent.sha;
    } catch (e) {
      logger.e(e);
    }
  });

  test('sha', () {
    print(sha);
  });
}
