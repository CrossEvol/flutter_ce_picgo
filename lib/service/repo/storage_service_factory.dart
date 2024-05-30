import 'package:flutter_ce_picgo/constants/image_storage_type.dart';

import 'storage_service.dart';
import 'impl/gitee_repo_service.dart';
import 'impl/github_repo_service.dart';

class StorageServiceFactory {
  StorageServiceFactory._();

  static final StorageServiceFactory _instance = StorageServiceFactory._();

  static StorageServiceFactory get instance => _instance;

  Map<String, StorageService> cache = {};

  /// UploadStrategy工厂类，负责创建UploadStrategy
  StorageService getUploadStrategy(String type) {
    if (type.isEmpty) {
      throw ArgumentError();
    }
    if (cache[type] == null) {
      if (type == ImageStorageType.github) {
        /// Github
        cache[type] = GithubRepoService();
      } else if (type == ImageStorageType.gitee) {
        /// Gitee
        cache[type] = GiteeRepoService();
      } else {
        throw UnimplementedError();
      }
    }
    return cache[type]!;
  }
}
