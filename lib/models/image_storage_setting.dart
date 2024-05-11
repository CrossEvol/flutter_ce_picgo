import 'package:json_annotation/json_annotation.dart';

import 'hive/hive_image_storage_setting.dart';

part 'image_storage_setting.g.dart';

@JsonSerializable()
class ImageStorageSetting {
  int id = 0;
  String type = "";
  String name = "";
  String config = "";
  String path = "";

  @JsonKey(toJson: _toJson, fromJson: _fromJson)
  bool visible = false;

  ImageStorageSetting();

  factory ImageStorageSetting.fromJson(Map<String, dynamic> json) =>
      _$ImageStorageSettingFromJson(json);

  Map<String, dynamic> toJson() => _$ImageStorageSettingToJson(this);

  static int _toJson(bool value) => value ? 1 : 0;

  static bool _fromJson(int value) => value == 0;

  @override
  String toString() {
    return 'ImageStorageSetting{id: $id, type: $type, name: $name, config: $config, path: $path, visible: $visible}';
  }
}

extension ImageStorageSettingExtensions on ImageStorageSetting {
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