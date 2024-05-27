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

// TODO: in android, does it need any permission?
Future<void> createImageCacheDir(String type) async {
  var dir = Directory(join(appDirectory, type));
  if (!dir.existsSync()) {
    await dir.create(recursive: true);
  }
}

// TODO: in android, does it need any permission?
Future<bool> clearImageCacheDir(String type) async {
  try {
    var dir = Directory(join(appDirectory, type));
    if (dir.existsSync()) await dir.delete(recursive: true);
    return true;
  } catch (e) {
    logger.e(e);
    return false;
  }
}
