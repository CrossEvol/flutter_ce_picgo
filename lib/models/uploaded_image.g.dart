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
      createTime:
          const DateTimeConverter().fromJson(json['createTime'] as String),
      uploadTime:
          const DateTimeConverter().fromJson(json['uploadTime'] as String),
      sha: json['sha'] as String?,
    );

Map<String, dynamic> _$UploadedImageToJson(UploadedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filepath': instance.filepath,
      'storageType': instance.storageType,
      'url': instance.url,
      'name': instance.name,
      'state': _$UploadStateEnumMap[instance.state]!,
      'sha': instance.sha,
      'createTime': const DateTimeConverter().toJson(instance.createTime),
      'uploadTime': const DateTimeConverter().toJson(instance.uploadTime),
    };

const _$UploadStateEnumMap = {
  UploadState.uploading: 'uploading',
  UploadState.saving: 'saving',
  UploadState.completed: 'completed',
  UploadState.uploadFailed: 'uploadFailed',
  UploadState.saveFailed: 'saveFailed',
};
