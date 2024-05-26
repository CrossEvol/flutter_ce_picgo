import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late String appDirectory;

Future<void> setupAppDirectory() async {
  appDirectory = (await getApplicationDocumentsDirectory()).path;
  await createImageCacheDir(ImageStorageType.github);
  await createImageCacheDir(ImageStorageType.gitee);
  if (kDebugMode) {
    logger.i(appDirectory);
  }
}

Future<void> createImageCacheDir(String type) async {
  var githubDir = Directory(join(appDirectory, type));
  if (!githubDir.existsSync()) {
    await githubDir.create(recursive: true);
  }
}
