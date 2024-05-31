import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/models/isar/isar_downloaded_image.dart';
import 'package:flutter_ce_picgo/models/isar/isar_image_storage_setting.dart';
import 'package:flutter_ce_picgo/models/isar/isar_uploaded_image.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/image_storage_type.dart';

DbInterface getInstance() => IsarDbProvider();

class IsarDbProvider implements DbInterface {
  late Isar isar;

  @override
  Future<List<ImageStorageSetting>> getAllSettings() async {
    var list = await isar.isarImageStorageSettings.where().findAll();
    return list.map((e) => e.fromIsarObject()).toList();
  }

  @override
  Future<String> getImageStorageSettingConfig({required String type}) async {
    await assertTypeFound(type);
    var isarImageStorageSetting = await isar.isarImageStorageSettings
        .filter()
        .typeEqualTo(type)
        .findFirst();
    if (kDebugMode) {
      logger.i(isarImageStorageSetting!.config);
    }
    return isarImageStorageSetting!.config;
  }

  Future<void> assertTypeFound(String type) async {
    if (!(await containsType(type: type))) {
      throw ArgumentError('Not Found $type');
    }
  }

  @override
  Future<void> init({bool isCreate = false}) async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        IsarImageStorageSettingSchema,
        IsarUploadedImageSchema,
        IsarDownloadedImageSchema
      ],
      directory: dir.path,
    );
    if (kDebugMode) {
      await isar.writeTxn(() async {
        await isar.isarImageStorageSettings.clear();
        await isar.isarUploadedImages.clear();
      });
    }
    await isar.writeTxn(() async {
      if (!(await containsType(type: ImageStorageType.github.name))) {
        await isar.isarImageStorageSettings.put(IsarImageStorageSetting(
            type: ImageStorageType.github.name,
            name: "Github图床",
            config: "",
            path: "/settings/pb/github",
            visible: true)); //
      }
      if (!(await containsType(type: ImageStorageType.gitee.name))) {
        await isar.isarImageStorageSettings.put(IsarImageStorageSetting(
            type: ImageStorageType.gitee.name,
            name: "Gitee图床",
            config: "",
            path: "/settings/pb/gitee",
            visible: true)); // insert & update
      }
    });
  }

  Future<bool> containsType({required String type}) async {
    var i =
        await isar.isarImageStorageSettings.filter().typeEqualTo(type).count();
    return i > 0;
  }

  @override
  Future<void> saveImageStorageSettingConfig(
      {required String type, required String config}) async {
    await isar.writeTxn(() async {
      var isarImageStorageSetting = await isar.isarImageStorageSettings
          .filter()
          .typeEqualTo(type)
          .findFirst();
      isarImageStorageSetting!.config = config;
      await isar.isarImageStorageSettings
          .filter()
          .typeEqualTo(type)
          .deleteAll();
      await isar.isarImageStorageSettings.put(isarImageStorageSetting);
    });
  }

  @override
  Future<String> getImageStorageSettingName({required String type}) async {
    await assertTypeFound(type);
    var isarImageStorageSetting = await isar.isarImageStorageSettings
        .filter()
        .typeEqualTo(type)
        .findFirst();
    return isarImageStorageSetting!.name;
  }

  @override
  Future<List<UploadedImage>> getUploadedImages() async {
    var list = await isar.isarUploadedImages.where().findAll();
    return list.map((e) => e.fromIsarObject()).toList();
  }

  @override
  Future<void> saveUploadedImage(UploadedImage uploadedImage) async {
    await isar.writeTxn(() async {
      await isar.isarUploadedImages.put(uploadedImage.toIsarObject());
    });
  }

  @override
  Future<bool> updateUploadedImage(
      {required String filepath,
      String? url,
      String? name,
      UploadState? state}) async {
    var isarUploadedImage = await isar.isarUploadedImages
        .filter()
        .filepathEqualTo(filepath)
        .findFirst();
    var bool = await isar.writeTxn(() async {
      try {
        var hasDeleted = await isar.isarUploadedImages
            .filter()
            .filepathEqualTo(filepath)
            .deleteFirst();
        if (hasDeleted) {
          await isar.isarUploadedImages.put(isarUploadedImage!
              .fromIsarObject()
              .copyWith(url: url, name: name, state: state)
              .toIsarObject());
        }
        return true;
      } catch (e) {
        logger.e(e);
        return false;
      }
    });
    return bool;
  }

  @override
  Future<bool> removeUploadImage(
      RemoveUploadImageVO removeUploadImageVO) async {
    final (id, filepath) = removeUploadImageVO;
    try {
      var i = await isar.isarUploadedImages
          .filter()
          .idEqualTo(id)
          .or()
          .filepathEqualTo(filepath)
          .deleteAll();
      return i >= 0;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  @override
  Future<List<DownloadedImage>> getDownloadedImages() async {
    var list = await isar.isarDownloadedImages.where().findAll();
    return list.map((e) => e.fromIsarObject()).toList();
  }

  @override
  Future<bool> removeDownloadedImage(
      RemoveDownloadedImageVo removeDownloadedImageVo) async {
    final (name, _, remoteUrl) = removeDownloadedImageVo;
    return await isar.writeTxn(() async {
      var i = await isar.isarDownloadedImages
          .filter()
          .nameEqualTo(name)
          .and()
          .remoteUrlEqualTo(remoteUrl)
          .deleteAll();
      return i > 0;
    });
  }

  @override
  Future<bool> saveDownloadedImage(DownloadedImage downloadedImage) async {
    return await isar.writeTxn(() async {
      var i =
          await isar.isarDownloadedImages.put(downloadedImage.toIsarObject());
      return i > 0;
    });
  }

  @override
  Future<bool> clearDownloadedImages() async {
    return await isar.writeTxn(() async {
      var i = await isar.isarDownloadedImages.where().deleteAll();
      return i > 0;
    });
  }

  @override
  Future<DownloadedImage> getDownloadedImage(
      GetDownloadedImageVo getDownloadedImageVo) async {
    final (name, _, remoteUrl) = getDownloadedImageVo;
    var isarDownloadedImage = await isar.isarDownloadedImages
        .filter()
        .nameEqualTo(name)
        .and()
        .remoteUrlEqualTo(remoteUrl)
        .findFirst();
    return isarDownloadedImage!.fromIsarObject();
  }

  @override
  Future<bool> existsDownloadedImage(
      ExistsDownloadedImageVo existsDownloadedImageVo) async {
    final (name, remoteUrl) = existsDownloadedImageVo;
    var i = await isar.isarDownloadedImages
        .filter()
        .nameEqualTo(name)
        .and()
        .remoteUrlEqualTo(remoteUrl)
        .count();
    return i > 0;
  }
}
