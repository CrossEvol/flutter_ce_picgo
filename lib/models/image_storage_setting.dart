import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

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
}

@HiveType(typeId: 0)
class HiveImageStorageSetting extends HiveObject{

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
}

