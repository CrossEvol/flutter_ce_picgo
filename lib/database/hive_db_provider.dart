import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/constants/table_name_keys.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDbProvider implements DbInterface {
  late Box<HiveImageStorageSetting> box;

  @override
  Future<List<ImageStorageSetting>> getAllSettings() async {
    return box.values.map((e) => e.fromHiveObject()).toList();
  }

  @override
  Future<void> init({bool isCreate = false}) async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveImageStorageSettingAdapter());
    box = await Hive.openBox(PB_SETTING_BOX);
    if (!box.containsKey(ImageStorageType.github)) {
      await box.put(
          ImageStorageType.github,
          HiveImageStorageSetting(
              id: 0,
              type: ImageStorageType.github,
              name: "Github图床",
              config: "",
              path: "/setting/pb/github",
              visible: true));
    }

    if (!box.containsKey(ImageStorageType.gitee)) {
      await box.put(
          ImageStorageType.gitee,
          HiveImageStorageSetting(
              id: 0,
              type: ImageStorageType.github,
              name: "Gitee图床",
              config: "",
              path: "/setting/pb/gitee",
              visible: true));
    }
  }
}