import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:isar/isar.dart';

part 'isar_image_storage_setting.g.dart';

// TODO: wait for the isar web support
@collection
class IsarImageStorageSetting {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String type = "";
  String name = "";
  @Index(type: IndexType.hash)
  String config = "";
  String path = "";
  bool visible = false;

  IsarImageStorageSetting.none();

  IsarImageStorageSetting(
      {required this.type,
      required this.name,
      required this.config,
      required this.path,
      required this.visible});
}

extension IsarImageStorageSettingExtension on IsarImageStorageSetting {
  ImageStorageSetting fromIsarObject() {
    return ImageStorageSetting()
      ..id = id
      ..type = type
      ..name = name
      ..config = config
      ..path = path
      ..visible = visible;
  }
}

extension ImageStorageSettingExtension on ImageStorageSetting {
  IsarImageStorageSetting toIsarObject() {
    return IsarImageStorageSetting(
        type: type,
        name: name,
        config: config,
        path: path,
        visible: visible);
  }
}
