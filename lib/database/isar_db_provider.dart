
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/models/isar/isar_image_storage_setting.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/image_storage_type.dart';

class IsarDbProvider implements DbInterface {
  late Isar isar;

  @override
  Future<List<ImageStorageSetting>> getAllSettings() async {
    var list = await isar.isarImageStorageSettings.where().findAll();
    return list.map((e) => e.fromIsarObject()).toList();
  }

  @override
  Future<String> getImageStorageSettingConfig({required String type}) async {
    if (!(await containsType(type: type))) {
      throw ArgumentError('Not Found $type');
    }
    var isarImageStorageSetting = await isar.isarImageStorageSettings
        .filter()
        .typeEqualTo(type)
        .findFirst();
    return isarImageStorageSetting!.config;
  }

  @override
  Future<void> init({bool isCreate = false}) async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [IsarImageStorageSettingSchema],
      directory: dir.path,
    );
    await isar.writeTxn(() async {
      if (!(await containsType(type: ImageStorageType.github))) {
        await isar.isarImageStorageSettings.put(IsarImageStorageSetting(
            id: 0,
            type: ImageStorageType.github,
            name: "Github图床",
            config: "",
            path: "/settings/pb/github",
            visible: true)); //
      }
      if (!(await containsType(type: ImageStorageType.gitee))) {
        await isar.isarImageStorageSettings.put(IsarImageStorageSetting(
            id: 0,
            type: ImageStorageType.gitee,
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
    throw UnimplementedError();
  }
}