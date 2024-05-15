import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:flutter_ce_picgo/utils/logger_util.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../constants/image_storage_type.dart';
import '../constants/table_name_keys.dart';

DbInterface getInstance() => SqfliteDbProvider();

class SqfliteDbProvider implements DbInterface {
  late Database db;

  @override
  Future<List<ImageStorageSetting>> getAllSettings() async {
    var list = await db.query(PB_SETTING_TABLE);
    for (var value in list) {
      logger.i(jsonEncode(value));
    }
    return list.map((e) => ImageStorageSetting.fromJson(e)).toList();
  }

  /// 获取数据库中所有的表
  Future<List<String>> getTables() async {
    if (db == null) {
      return Future.value([]);
    }
    List<Map<String, dynamic>> tables = await db
        .rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    List<String> targetList = [];
    for (var item in tables) {
      targetList.add(item['name']);
    }
    return targetList;
  }

  /// 检查数据库中, 表是否存在
  Future checkTableIsRight(String expectTables) async {
    List<String> tables = await getTables();
    return tables.contains(expectTables);
  }

  /// 初始化数据库
  @override
  Future<void> init({bool isCreate = false}) async {
    if (Platform.isWindows) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'PicGo.db');
    try {
      db = await openDatabase(
        path,
        version: 9,
        onCreate: (db, version) async {
          // 创建pb_setting表
          await _initPb(db);

          // 创建 uploaded_image 表
          await _initUploadedImages(db);

          // 创建uploaded表
          await db.execute('''
          CREATE TABLE $UPLOADED_TABLE (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            path varchar(255) NOT NULL,
            type varchar(20) NOT NULL,
            info varchar(255)
          )''');
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          await _initPb(db);

          await _initUploadedImages(db);

          /// v1 to v2
          if (oldVersion == 1) {
            await _upgradeDbV1ToV2(db);
          }
        },
      );
    } catch (e) {
      var file = File(path);
      file.deleteSync();
    }
  }

  /// 初始化图床设置表
  Future<void> _initPb(Database db) async {
    List tables = await db
        .rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    bool isExists = false;
    for (var item in tables) {
      if (item['name'] == PB_SETTING_TABLE) {
        isExists = true;
      }
    }
    if (isExists) {
      await db.execute(
          'ALTER TABLE $PB_SETTING_TABLE RENAME TO ${PB_SETTING_TABLE + "_backup"}');
    }
    // 创建pb_setting表
    await db.execute('''
          CREATE TABLE $PB_SETTING_TABLE (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type varchar(20) NOT NULL UNIQUE,
            path varchar(20) NOT NULL UNIQUE,
            name varchar(50) DEFAULT "",
            config varchar(255) DEFAULT "",
            visible INTEGER DEFAULT 1
          )''');

    /// github图床
    await db.rawInsert(
        'INSERT INTO $PB_SETTING_TABLE(type, path, name, config, visible) VALUES("${ImageStorageType.github}", "/settings/pb/github", "Github图床", "", 1)');

    /// Gitee图床
    await db.rawInsert(
        'INSERT INTO $PB_SETTING_TABLE(type, path, name, config, visible) VALUES("${ImageStorageType.gitee}", "/settings/pb/gitee", "Gitee图床", "", 1)');

    // copy data
    // update authors set dynasty_index=(select id  from dynasties where dynasties .name=authors.dynasty) where dynasty in (select name from dynasties )
    if (isExists) {
      await db.execute('''
          UPDATE $PB_SETTING_TABLE SET config = 
          (SELECT config FROM ${PB_SETTING_TABLE + "_backup"} WHERE ${PB_SETTING_TABLE + "_backup"}.type = $PB_SETTING_TABLE.type)
          ''');
      // drop backup
      await db.execute('DROP TABLE IF EXISTS ${PB_SETTING_TABLE + "_backup"}');
    }
  }

  Future<void> _initUploadedImages(Database db) async {
    await db.execute('''
     CREATE TABLE IF NOT EXISTS $UPLOADED_IMAGE_TABLE  (
        id INTEGER PRIMARY KEY,
        filepath TEXT NOT NULL DEFAULT '',
        storageType TEXT NOT NULL DEFAULT '',
        url TEXT NOT NULL DEFAULT '',
        name TEXT NOT NULL DEFAULT '',
        state TEXT NOT NULL DEFAULT '',
        createTime TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        uploadTime TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
    );
     ''');
  }

  /// db版本升级
  Future<void> _upgradeDbV1ToV2(Database db) async {
    await db
        .execute('ALTER TABLE $UPLOADED_TABLE ADD COLUMN info varchar(255)');
  }

  @override
  Future<void> saveImageStorageSettingConfig(
      {required String type, required String config}) async {
    var list = await db.query(PB_SETTING_TABLE,
        where: "type = ?", whereArgs: [type], limit: 1);
    var imageStorageSetting = ImageStorageSetting.fromJson(list.first);
    imageStorageSetting.config = config;
    await db.update(PB_SETTING_TABLE, imageStorageSetting.toJson(),
        where: "type = ? ", whereArgs: [type]);
  }

  @override
  Future<String> getImageStorageSettingConfig({required String type}) async {
    var list = (await db
        .rawQuery('SELECT * FROM $PB_SETTING_TABLE WHERE type = ?', [type]));
    return ImageStorageSetting.fromJson(list.first).config;
  }

  @override
  Future<String> getImageStorageSettingName({required String type}) async {
    var list = (await db
        .rawQuery('SELECT * FROM $PB_SETTING_TABLE WHERE type = ?', [type]));
    return ImageStorageSetting.fromJson(list.first).name;
  }

  @override
  Future<List<UploadedImage>> getUploadedImages() async {
    var list = await db.query(UPLOADED_IMAGE_TABLE);
    return list.map((e) => UploadedImage.fromJson(e)).toList();
  }

  @override
  Future<void> saveUploadedImage(UploadedImage uploadedImage) async {
    var map = uploadedImage.toJson();
    map.remove('id');
    await db.insert(UPLOADED_IMAGE_TABLE, map);
  }

  @override
  Future<bool> updateUploadedImage(
      {required String filepath,
      String? url,
      String? name,
      UploadState? state}) async {
    try {
      var oldImage = UploadedImage.fromJson((await db.query(
              UPLOADED_IMAGE_TABLE,
              where: 'filepath = ?',
              whereArgs: [filepath],
              limit: 1))
          .first);
      var newImage = oldImage.copyWith(url: url, name: name, state: state);
      var map = newImage.toJson();
      map.remove('id');
      var i = await db.update(UPLOADED_IMAGE_TABLE, map);
      if (i > 0) {
        return true;
      }
      return false;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
