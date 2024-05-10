import 'package:flutter_ce_picgo/constants/image_storage_type.dart';
import 'package:flutter_ce_picgo/constants/table_name_keys.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDbProvider implements DbInterface {
  late Box<HiveImageStorageSetting> box;

  @override
  Future<List> getAllSettings() {
    // TODO: implement getAllSettings
    throw UnimplementedError();
  }

  @override
  Future<void> init({bool isCreate = false}) async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveImageStorageSettingAdapter());
    box = await Hive.openBox(PB_SETTING_BOX);
    // await box.put(ImageStorageType.github,);
    // await box.put(ImageStorageType.gitee, 1);
  }
}
