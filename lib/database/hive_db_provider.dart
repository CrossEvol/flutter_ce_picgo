import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/constants/table_name_keys.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/hive/hive_image_storage_setting.dart';

DbInterface getInstance() => HiveDbProvider();

class HiveDbProvider implements DbInterface {
  // iss = Image Storage Setting
  late Box<HiveImageStorageSetting> issBox;

  @override
  Future<List<ImageStorageSetting>> getAllSettings() async {
    return issBox.values.map((e) => e.fromHiveObject()).toList();
  }

  @override
  Future<void> init({bool isCreate = false}) async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveImageStorageSettingAdapter());
    issBox = await Hive.openBox(PB_SETTING_BOX);
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
      {required String type, required String config}) {
    // TODO: implement saveImageStorageSettingConfig
    throw UnimplementedError();
  }

  @override
  Future<String> getImageStorageSettingConfig({required String type}) async {
    if (!issBox.containsKey(type)) {
      throw ArgumentError('Not Found $type');
    }
    var hiveImageStorageSetting = issBox.get(type);
    return hiveImageStorageSetting!.config;
  }
}
