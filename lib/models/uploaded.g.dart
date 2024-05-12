// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Uploaded _$UploadedFromJson(Map<String, dynamic> json) => Uploaded(
      id: (json['id'] as num).toInt(),
      path: json['path'] as String,
      type: json['type'] as String,
      info: json['info'] as String,
    );

Map<String, dynamic> _$UploadedToJson(Uploaded instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'type': instance.type,
      'info': instance.info,
    };
