// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedImage _$UploadedImageFromJson(Map<String, dynamic> json) =>
    UploadedImage(
      id: (json['id'] as num).toInt(),
      filepath: json['filepath'] as String,
      storageType: json['storageType'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      state: $enumDecode(_$UploadStateEnumMap, json['state']),
      createTime: DateTime.parse(json['createTime'] as String),
      uploadTime: DateTime.parse(json['uploadTime'] as String),
    );

Map<String, dynamic> _$UploadedImageToJson(UploadedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filepath': instance.filepath,
      'storageType': instance.storageType,
      'url': instance.url,
      'name': instance.name,
      'state': _$UploadStateEnumMap[instance.state]!,
      'createTime': instance.createTime.toIso8601String(),
      'uploadTime': instance.uploadTime.toIso8601String(),
    };

const _$UploadStateEnumMap = {
  UploadState.uploading: 'uploading',
  UploadState.saving: 'saving',
  UploadState.completed: 'completed',
  UploadState.uploadFailed: 'uploadFailed',
  UploadState.saveFailed: 'saveFailed',
};
