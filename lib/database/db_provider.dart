import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../constants/image_storage_type.dart';
import '../constants/table_name_keys.dart';

late DbProvider dbProvider;

class DbProvider {
  late Database db;

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
  Future init({bool isCreate = false}) async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'PicGo.db');
    try {
      db = await openDatabase(
        path,
        version: 9,
        onCreate: (db, version) async {
          // 创建pb_setting表
          _initPb(db);
          // 创建uploaded表
          await db.execute('''
          CREATE TABLE $UPLOADED_TABLE (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            path varchar(255) NOT NULL,
            type varchar(20) NOT NULL,
            info varchar(255)
          )''');
        },
        onUpgrade: (db, oldVersion, newVersion) {
          _initPb(db);

          /// v1 to v2
          if (oldVersion == 1) {
            _upgradeDbV1ToV2(db);
          }
        },
      );
    } catch (e) {
      var file = File(path);
      file.deleteSync();
    }
  }

  /// 初始化图床设置表
  _initPb(Database db) async {
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
        'INSERT INTO $PB_SETTING_TABLE(type, path, name, config, visible) VALUES("${ImageStorageType.github}", "/setting/pb/github", "Github图床", "", 1)');

    /// Gitee图床
    await db.rawInsert(
        'INSERT INTO $PB_SETTING_TABLE(type, path, name, config, visible) VALUES("${ImageStorageType.gitee}", "/setting/pb/gitee", "Gitee图床", "", 1)');

    // copy data
    // update authors set dynasty_index=(select id  from dynasties where dynasties .name=authors.dynasty) where dynasty in (select name from dynasties )
    if (isExists) {
      await db.execute('''
          UPDATE $PB_SETTING_TABLE SET config = 
          (SELECT config FROM ${PB_SETTING_TABLE + "_backup"} WHERE ${PB_SETTING_TABLE + "_backup"}.type = $PB_SETTING_TABLE.type)
          ''');
      // drop backup
      await db
          .execute('DROP TABLE IF EXISTS ${PB_SETTING_TABLE + "_backup"}');
    }
  }

  /// db版本升级
  _upgradeDbV1ToV2(Database db) async {
    await db.execute(
        'ALTER TABLE $UPLOADED_TABLE ADD COLUMN info varchar(255)');
  }
}
