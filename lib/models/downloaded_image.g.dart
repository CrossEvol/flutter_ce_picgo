// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadedImage _$DownloadedImageFromJson(Map<String, dynamic> json) =>
    DownloadedImage(
      id: (json['id'] as num).toInt(),
      path: json['path'] as String,
      name: json['name'] as String,
      sha: json['sha'] as String,
      downloadedAt: DateTime.parse(json['downloaded_at'] as String),
    );

Map<String, dynamic> _$DownloadedImageToJson(DownloadedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'name': instance.name,
      'sha': instance.sha,
      'downloaded_at': instance.downloadedAt.toIso8601String(),
    };
