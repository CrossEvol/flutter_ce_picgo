import 'package:hive/hive.dart';

import '../image_storage_setting.dart';

part 'hive_image_storage_setting.g.dart';

@HiveType(typeId: 0)
class HiveImageStorageSetting extends HiveObject {
  @HiveField(0)
  int id = 0;

  @HiveField(1)
  String type = "";

  @HiveField(2)
  String name = "";

  @HiveField(3)
  String config = "";

  @HiveField(4)
  String path = "";

  @HiveField(5)
  bool visible = false;

  HiveImageStorageSetting({
    required this.id,
    required this.type,
    required this.name,
    required this.config,
    required this.path,
    required this.visible,
  });

  @override
  String toString() {
    return 'HiveImageStorageSetting{id: $id, type: $type, name: $name, config: $config, path: $path, visible: $visible}';
  }
}

extension HiveImageStorageSettingExtension on HiveImageStorageSetting {
  ImageStorageSetting fromHiveObject() {
    return ImageStorageSetting()
      ..id = id
      ..type = type
      ..name = name
      ..config = config
      ..path = path
      ..visible = visible;
  }


  HiveImageStorageSetting toHiveObject() {
    return HiveImageStorageSetting(
        id: id,
        type: type,
        name: name,
        config: config,
        path: path,
        visible: visible);
  }
}
