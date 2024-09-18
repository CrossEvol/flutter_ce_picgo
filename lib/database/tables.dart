import 'dart:ui';

export 'dart:ui' show Color;

import 'package:drift/drift.dart';
import 'package:flutter_ce_picgo/constants/table_name_keys.dart';

@DataClassName(PB_SETTING_TABLE)
class PbSettingsT extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get type => text().withLength(min: 0, max: 20).withDefault(const Constant(""))();

  TextColumn get path => text().withLength(min: 0, max: 20).withDefault(const Constant(""))();

  TextColumn get name =>
      text().withLength(min: 0, max: 50).withDefault(const Constant(""))();

  TextColumn get config =>
      text().withLength(min: 0, max: 255).withDefault(const Constant(""))();

  IntColumn get visible => integer().withDefault(const Constant(1))();
}

@DataClassName(UPLOADED_IMAGE_TABLE)
class UploadedImagesT extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get filepath => text().withLength(min: 0, max: 255).withDefault(const Constant(""))();

  TextColumn get storageType => text().withLength(min: 0, max: 20).withDefault(const Constant(""))();

  TextColumn get url => text().withLength(min: 0, max: 255).withDefault(const Constant(""))();

  TextColumn get sha => text().withLength(min: 0).withDefault(const Constant(""))();

  TextColumn get name => text().withLength(min: 0, max: 255).withDefault(const Constant(""))();

  TextColumn get state => text().withLength(min: 0, max: 255).withDefault(const Constant(""))();

  DateTimeColumn get createTime => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get uploadTime => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName(DOWNLOADED_IMAGE_TABLE)
class DownloadedImagesT extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 0, max: 255).withDefault(const Constant(""))();

  TextColumn get localUrl => text().withLength(min: 0, max: 255).withDefault(const Constant(""))();

  TextColumn get remoteUrl => text().withLength(min: 0, max: 255).withDefault(const Constant(""))();

  TextColumn get sha => text().withLength(min: 0).withDefault(const Constant(""))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
