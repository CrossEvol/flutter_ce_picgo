import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_ce_picgo/database/db_interface.dart';
import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';

part 'sqflite_db_provider.g.dart';

DbInterface getInstance() => DriftDbProvider();

@DriftDatabase(tables: [PbSettingsT, UploadedImagesT, DownloadedImagesT])
class DriftDbProvider extends _$DriftDbProvider implements DbInterface {
  DriftDbProvider() : super(_openConnection());

  @override
  int get schemaVersion => 10; // 更新 schema 版本

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'PicGo.db'));
      return NativeDatabase(file);
    });
  }

  @override
  Future<List<ImageStorageSetting>> getAllSettings() async {
    final settings = await select(pbSettingsT).get();
    return settings
        .map((e) => ImageStorageSetting.fromJson(e.toJson()))
        .toList();
  }

  @override
  Future<void> init({bool isCreate = false}) async {
    await customStatement('PRAGMA foreign_keys = ON');
    if (isCreate) {
      await _initPb();
      await _initUploadedImages();
      await _initDownloadedImages();
    }
  }

  Future<void> _initPb() async {
    await into(pbSettingsT).insert(PbSettingsTCompanion.insert(
      type: const Value('github'),
      path: const Value('/settings/pb/github'),
      name: const Value('Github图床'),
      config: const Value(''),
      visible: const Value(1),
    ));
    await into(pbSettingsT).insert(PbSettingsTCompanion.insert(
      type: const Value('gitee'),
      path: const Value('/settings/pb/gitee'),
      name: const Value('Gitee图床'),
      config: const Value(''),
      visible: const Value(1),
    ));
  }

  Future<void> _initUploadedImages() async {
    // Initialization logic for uploaded images if needed
  }

  Future<void> _initDownloadedImages() async {
    // Initialization logic for downloaded images if needed
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await init(isCreate: true);
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 10) {
            // 添加新的 parentPath 列
            await m.addColumn(downloadedImagesT, downloadedImagesT.parentPath);
          }
        },
      );

  @override
  Future<void> saveImageStorageSettingConfig(
      {required String type, required String config}) async {
    await (update(pbSettingsT)..where((tbl) => tbl.type.equals(type)))
        .write(PbSettingsTCompanion(config: Value(config)));
  }

  @override
  Future<String> getImageStorageSettingConfig({required String type}) async {
    final setting = await (select(pbSettingsT)
          ..where((tbl) => tbl.type.equals(type)))
        .getSingle();
    return setting.config;
  }

  @override
  Future<String> getImageStorageSettingName({required String type}) async {
    final setting = await (select(pbSettingsT)
          ..where((tbl) => tbl.type.equals(type)))
        .getSingle();
    return setting.name;
  }

  @override
  Future<List<UploadedImage>> getUploadedImages() async {
    final images = await select(uploadedImagesT).get();
    return images.map((e) => UploadedImage.fromJson(e.toJson())).toList();
  }

  @override
  Future<void> saveUploadedImage(UploadedImage uploadedImage) async {
    await into(uploadedImagesT).insert(UploadedImagesTCompanion.insert(
      filepath: Value(uploadedImage.filepath),
      storageType: Value(uploadedImage.storageType),
      url: Value(uploadedImage.url),
      sha: Value(uploadedImage.sha ?? ''),
      name: Value(uploadedImage.name),
      state: Value(uploadedImage.state.name),
      createTime: Value(uploadedImage.createTime),
      uploadTime: Value(uploadedImage.uploadTime),
    ));
  }

  @override
  Future<bool> updateUploadedImage(
      {required String filepath,
      String? url,
      String? name,
      UploadState? state}) async {
    final updated = await (update(uploadedImagesT)
          ..where((tbl) => tbl.filepath.equals(filepath)))
        .write(UploadedImagesTCompanion(
      url: Value(url ?? ''),
      name: Value(name ?? ''),
      state: Value(state!.name),
    ));
    return updated > 0;
  }

  @override
  Future<bool> removeUploadImage(
      RemoveUploadImageVO removeUploadImageVO) async {
    final (id, filepath) = removeUploadImageVO;
    final deleted = await (delete(uploadedImagesT)
          ..where((tbl) => tbl.id.equals(id) | tbl.filepath.equals(filepath)))
        .go();
    return deleted > 0;
  }

  @override
  Future<List<DownloadedImage>> getDownloadedImages() async {
    final images = await select(downloadedImagesT).get();
    return images.map((e) => DownloadedImage.fromJson(e.toJson())).toList();
  }

  @override
  Future<bool> removeDownloadedImage(
      RemoveDownloadedImageVo removeDownloadedImageVo) async {
    final (name, _, remoteUrl) = removeDownloadedImageVo;
    final deleted = await (delete(downloadedImagesT)
          ..where(
              (tbl) => tbl.name.equals(name) & tbl.remoteUrl.equals(remoteUrl)))
        .go();
    return deleted > 0;
  }

  @override
  Future<bool> saveDownloadedImage(DownloadedImage downloadedImage) async {
    await into(downloadedImagesT).insert(DownloadedImagesTCompanion.insert(
      name: Value(downloadedImage.name),
      localUrl: Value(downloadedImage.localUrl),
      remoteUrl: Value(downloadedImage.remoteUrl),
      sha: Value(downloadedImage.sha),
      createdAt: Value(downloadedImage.createdAt),
      parentPath: Value(downloadedImage.parentPath),
    ));
    return true;
  }

  @override
  Future<bool> clearDownloadedImages() async {
    final deleted = await delete(downloadedImagesT).go();
    return deleted > 0;
  }

  @override
  Future<DownloadedImage> getDownloadedImage(
      GetDownloadedImageVo getDownloadedImageVo) async {
    final (name, _, remoteUrl) = getDownloadedImageVo;
    /* Todo: There has some race conditions to save the url twice which make the error */
    final image = await (select(downloadedImagesT)
          ..where(
              (tbl) => tbl.name.equals(name) & tbl.remoteUrl.equals(remoteUrl)))
        .getSingle();

    // can not use DownloadedImage.fromJson(image.toJson()),
    // type int not a subType of String,
    // but I do not know where is the problem
    return DownloadedImage(
        id: image.id,
        localUrl: image.localUrl,
        remoteUrl: image.remoteUrl,
        name: image.name,
        sha: image.sha,
        createdAt: image.createdAt,
        parentPath: image.parentPath);
  }

  @override
  Future<bool> existsDownloadedImage(
      ExistsDownloadedImageVo existsDownloadedImageVo) async {
    final (name, remoteUrl) = existsDownloadedImageVo;
    final count = await (selectOnly(downloadedImagesT)
          ..addColumns([downloadedImagesT.id])
          ..where(downloadedImagesT.name.equals(name) &
              downloadedImagesT.remoteUrl.equals(remoteUrl)))
        .get();
    return count.isNotEmpty;
  }
}
