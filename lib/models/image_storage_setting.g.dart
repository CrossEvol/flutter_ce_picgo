// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_storage_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageStorageSetting _$ImageStorageSettingFromJson(Map<String, dynamic> json) =>
    ImageStorageSetting()
      ..id = (json['id'] as num).toInt()
      ..type = json['type'] as String
      ..name = json['name'] as String
      ..config = json['config'] as String
      ..path = json['path'] as String
      ..visible =
          ImageStorageSetting._fromJson((json['visible'] as num).toInt());

Map<String, dynamic> _$ImageStorageSettingToJson(
        ImageStorageSetting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'config': instance.config,
      'path': instance.path,
      'visible': ImageStorageSetting._toJson(instance.visible),
    };
