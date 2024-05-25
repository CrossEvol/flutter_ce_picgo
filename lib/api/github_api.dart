import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/models/file.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';
import 'package:flutter_ce_picgo/models/github_content.dart';

import '../utils/logger_util.dart';

typedef GetImagesResult = (String name, String sha);

class GithubApi {
  static Future<List<GetImagesResult>> getImages(
      GithubConfig githubConfig) async {
    Dio dio = Dio();

    // Set headers
    dio.options.headers['Accept'] = 'application/vnd.github+json';
    dio.options.headers['Authorization'] = 'Bearer ${githubConfig.token}';
    dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    var response = await dio.get<List<dynamic>>(
        'https://api.github.com/repos/${githubConfig.repo}/contents');
    if (response.statusCode != 200) {
      throw DioException(requestOptions: RequestOptions());
    }
    return response.data!
        .map((e) => e as Map<String, dynamic>)
        .map((e) => GithubContent.fromJson(e))
        .where((element) => element.type == FileContentType.file)
        .map((e) => (
              'https://api.github.com/repos/${githubConfig.repo}/contents/${e.name}',
              e.sha
            ))
        .toList();
  }
}
