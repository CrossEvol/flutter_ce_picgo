import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';

const githubToken = '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';
const repo = 'CrossEvol/picgo-repo';

void main() async {
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

  // Perform PUT request
  try {
    Response response = await dio.put(
      'https://api.github.com/repos/$repo/contents/${DateTime.now().millisecond}.jpg',
      data: requestBody,
      options: Options(contentType: Headers.jsonContentType),
    );
    print(response.data);
  } catch (e) {
    print('Error: $e');
  }
}

Future<FormData> createFormData() async {
  return FormData.fromMap({
    'file': await MultipartFile.fromFile(
        r'D:\androidStudio\AndroidStudioProjects\flutter_ce_picgo\assets\images\icon_empty_album.png',
        filename: 'empty.jpg'),
  });
}
