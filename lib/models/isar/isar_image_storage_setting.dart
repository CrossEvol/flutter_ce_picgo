import 'package:flutter_ce_picgo/models/image_storage_setting.dart';
import 'package:isar/isar.dart';

part 'isar_image_storage_setting.g.dart';

@collection
class IsarImageStorageSetting {
  Id id = Isar.autoIncrement;
  String type = "";
  String name = "";
  String config = "";
  String path = "";
  bool visible = false;

  IsarImageStorageSetting.none();

  IsarImageStorageSetting(
      {required this.id,
      required this.type,
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

  IsarImageStorageSetting toIsarObject() {
    return IsarImageStorageSetting(
        id: id,
        type: type,
        name: name,
        config: config,
        path: path,
        visible: visible);
  }
}
