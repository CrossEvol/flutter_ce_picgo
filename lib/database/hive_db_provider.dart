import 'package:flutter/foundation.dart';
import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/constants/table_name_keys.dart';
import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:flutter_ce_picgo/models/hive/hive_uploaded_image.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/hive/hive_image_storage_setting.dart';

DbInterface getInstance() => HiveDbProvider();

class HiveDbProvider implements DbInterface {
  // iss = Image Storage Setting
  late Box<HiveImageStorageSetting> issBox;

  late Box<HiveUploadedImage> uploadedImageBox;

  @override
  Future<List<ImageStorageSetting>> getAllSettings() async {
    return issBox.values.map((e) => e.fromHiveObject()).toList();
  }

  @override
  Future<void> init({bool isCreate = false}) async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveImageStorageSettingAdapter());
    Hive.registerAdapter(HiveUploadedImageAdapter());
    Hive.registerAdapter(UploadStateAdapter());
    issBox = await Hive.openBox(PB_SETTING_BOX);
    if (kDebugMode) {
      await issBox.clear();
    }
    uploadedImageBox = await Hive.openBox(UPLOADED_IMAGE_BOX);
    if (kDebugMode) {
      await uploadedImageBox.clear();
    }
    if (!issBox.containsKey(ImageStorageType.github)) {
      await issBox.put(
          ImageStorageType.github,
          HiveImageStorageSetting(
              id: 0,
              type: ImageStorageType.github,
              name: "Github图床",
              config: "",
              path: "/settings/pb/github",
              visible: true));
    }

    if (!issBox.containsKey(ImageStorageType.gitee)) {
      await issBox.put(
          ImageStorageType.gitee,
          HiveImageStorageSetting(
              id: 0,
              type: ImageStorageType.github,
              name: "Gitee图床",
              config: "",
              path: "/settings/pb/gitee",
              visible: true));
    }
  }

  @override
  Future<void> saveImageStorageSettingConfig(
      {required String type, required String config}) async {
    assertTypeFound(type);
    var hiveImageStorageSetting = issBox.get(type);
    hiveImageStorageSetting!.config = config;
    await issBox.put(type, hiveImageStorageSetting);
  }

  void assertTypeFound(String type) {
    if (!issBox.containsKey(type)) {
      throw ArgumentError('Not Found $type');
    }
  }

  @override
  Future<String> getImageStorageSettingConfig({required String type}) async {
    assertTypeFound(type);
    var hiveImageStorageSetting = issBox.get(type);
    return hiveImageStorageSetting!.config;
  }

  @override
  Future<String> getImageStorageSettingName({required String type}) async {
    assertTypeFound(type);
    var hiveImageStorageSetting = issBox.get(type);
    return hiveImageStorageSetting!.name;
  }

  @override
  Future<List<UploadedImage>> getUploadedImages() async {
    return uploadedImageBox.values.map((e) => e.fromHiveObject()).toList();
  }

  @override
  Future<void> saveUploadedImage(UploadedImage uploadedImage) async {
    await uploadedImageBox.put(
        uploadedImage.filepath, uploadedImage.toHiveObject());
    // await uploadedImageBox.add(uploadedImage.toHiveObject());
  }

  @override
  Future<bool> updateUploadedImage(
      {required String filepath,
      String? url,
      String? name,
      UploadState? state}) async {
    try {
      var hiveUploadedImage = uploadedImageBox.get(filepath);
      var image = hiveUploadedImage!
          .fromHiveObject()
          .copyWith(
              url: url, name: name, state: state, uploadTime: DateTime.now())
          .toHiveObject();
      await uploadedImageBox.put(filepath, image);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  @override
  Future<bool> removeUploadImage(RemoveUploadImageVO removeUploadImageVO) {
    // TODO: implement removeUploadImage
    throw UnimplementedError();
  }
}
