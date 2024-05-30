import 'package:flutter_ce_picgo/models/gitee_config.dart';
import 'package:flutter_ce_picgo/models/gitee_content.dart';

import '../models/downloaded_image.dart';
import '../models/get_image_result.dart';


class GiteeApi {
  static Future<List<GetImagesResult>> getImages(
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
