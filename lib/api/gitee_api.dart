import 'package:flutter_ce_picgo/common/interfaces/interface.dart';
import 'package:flutter_ce_picgo/models/gitee_config.dart';
import 'package:flutter_ce_picgo/models/gitee_content.dart';

import '../models/downloaded_image.dart';

// typedef GiteeImagesResult = (
//   String name,
//   String remoteUrl,
//   String downloadUrl,
//   String sha
// );

class GiteeImagesResult implements IGetImages{
  final String name;
  final String remoteUrl;
  final String downloadUrl;
  final String sha;

  const GiteeImagesResult({
    required this.name,
    required this.remoteUrl,
    required this.downloadUrl,
    required this.sha,
  });
}

class GiteeApi {
  static Future<List<GiteeImagesResult>> getImages(
      GiteeConfig giteeConfig) async {
    throw UnimplementedError();
  }

  static Future<GiteeContent> downloadImage(
      {required GiteeConfig giteeConfig,
      required String src,
      required String dest}) async {
    throw UnimplementedError();
  }

  static Future<bool> removeImage(
      {required GiteeConfig giteeConfig,
      required DownloadedImage downloadedImage}) async {
    throw UnimplementedError();
  }
}
