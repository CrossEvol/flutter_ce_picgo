import 'package:flutter_ce_picgo/constants/image_storage_type.dart';

import 'image_upload_strategy.dart';
import 'impl/gitee_image_upload.dart';
import 'impl/github_image_upload.dart';

class UploadStrategyFactory {
  static Map<String, ImageUploadStrategy> cache = {};

  /// UploadStrategy工厂类，负责创建UploadStrategy
  static ImageUploadStrategy getUploadStrategy(String type) {
    if (type.isEmpty) {
      throw ArgumentError();
    }
    if (cache[type] == null) {
      if (type == ImageStorageType.github) {
        /// Github
        cache[type] = GithubImageUpload();
      } else if (type == ImageStorageType.gitee) {
        /// Gitee
        cache[type] = GiteeImageUpload();
      } else {
        throw UnimplementedError();
      }
    }
    return cache[type]!;
  }
}
