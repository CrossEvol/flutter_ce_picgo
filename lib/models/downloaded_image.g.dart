// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadedImage _$DownloadedImageFromJson(Map<String, dynamic> json) =>
    DownloadedImage(
      id: (json['id'] as num).toInt(),
      localUrl: json['local_url'] as String,
      remoteUrl: json['remote_url'] as String,
      name: json['name'] as String,
      sha: json['sha'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$DownloadedImageToJson(DownloadedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'local_url': instance.localUrl,
      'remote_url': instance.remoteUrl,
      'name': instance.name,
      'sha': instance.sha,
      'created_at': instance.createdAt.toIso8601String(),
    };
