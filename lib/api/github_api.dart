import 'package:dio/dio.dart';
import 'package:flutter_ce_picgo/common/interfaces/interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/file.dart';
import 'package:flutter_ce_picgo/models/github_config.dart';
import 'package:flutter_ce_picgo/models/github_content.dart';
import 'package:flutter_ce_picgo/utils/file_util.dart';

import '../utils/logger_util.dart';

// typedef GithubImagesResult = (
//   String name,
//   String remoteUrl,
//   String downloadUrl,
//   String sha
// );

class GithubImagesResult implements IGetImages {
  final String name;
  final String remoteUrl;
  final String downloadUrl;
  final String sha;

  const GithubImagesResult({
    required this.name,
    required this.remoteUrl,
    required this.downloadUrl,
    required this.sha,
  });
}

class GithubApi {
  static Future<List<GithubImagesResult>> getImages(
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
        .map((e) => GithubImagesResult(
                name: e.name,
                remoteUrl: e.url,
                downloadUrl: e.downloadUrl,
                sha: e.sha)
            // (
            //           e.name,
            //           // 'https://api.github.com/repos/${githubConfig.repo}/contents/${e.name}
            //           e.url,
            //           e.downloadUrl,
            //           e.sha
            //         )
            )
        .toList();
  }

  static Future<GithubContent> downloadImage(
      {required GithubConfig githubConfig,
      required String src,
      required String dest}) async {
    Dio dio = Dio();

    // Set headers
    dio.options.headers['Accept'] = 'application/vnd.github+json';
    dio.options.headers['Authorization'] = 'Bearer ${githubConfig.token}';
    dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    var response = await dio
        .get('https://api.github.com/repos/${githubConfig.repo}/contents/$src');
    if (response.statusCode != 200) {
      throw DioException(
          requestOptions: RequestOptions(
              sourceStackTrace:
                  StackTrace.fromString(('failed to download image..'))));
    }
    var githubContent =
        GithubContent.fromJson(response.data! as Map<String, dynamic>);
    var flag = await saveBase64ToFile(githubContent.content!, dest);
    if (flag) {
      return githubContent;
    } else {
      throw DioException(
          requestOptions: RequestOptions(
              sourceStackTrace:
                  StackTrace.fromString('failed to save image...')));
    }
  }

  static Future<bool> removeImage(
      {required GithubConfig githubConfig,
      required DownloadedImage downloadedImage}) async {
    Dio dio = Dio();

    // Set headers
    dio.options.headers['Accept'] = 'application/vnd.github+json';
    dio.options.headers['Authorization'] = 'Bearer ${githubConfig.token}';
    dio.options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, logPrint: (o) => logger.w(o)));

    Map<String, dynamic> requestBody = {
      'message': 'my commit message',
      'sha': downloadedImage.sha,
    };

    // Perform DELETE request
    try {
      Response response = await dio.delete(
        // 'https://api.github.com/repos/${githubConfig.repo}/contents/${downloadedImage.name}',
        downloadedImage.remoteUrl,
        data: requestBody,
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200 && response.data['content'] == null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
