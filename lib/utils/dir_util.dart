import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late String appStorageDirectory;

Future<void> setupAppDirectory() async {
  if (Platform.isWindows) {
    appStorageDirectory = (await getApplicationDocumentsDirectory()).path;
  } else if (Platform.isAndroid) {
    appStorageDirectory =
        (await getExternalStorageDirectories(type: StorageDirectory.pictures))!
            .first
            .path;
  }
  await createImageCacheDir(ImageStorageType.github.name);
  await createImageCacheDir(ImageStorageType.gitee.name);
  if (kDebugMode) {
    logger.i(appStorageDirectory);
  }
}

// TODO: in android, does it need any permission?
Future<void> createImageCacheDir(String type) async {
  var dir = Directory(join(appStorageDirectory, type));
  if (!dir.existsSync()) {
    await dir.create(recursive: true);
  }
}

// TODO: in android, does it need any permission?
Future<bool> clearImageCacheDir(String type) async {
  try {
    var dir = Directory(join(appStorageDirectory, type));
    if (dir.existsSync()) await dir.delete(recursive: true);
    return true;
  } catch (e) {
    logger.e(e);
    return false;
  }
}
