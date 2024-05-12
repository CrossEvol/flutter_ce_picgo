// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitee_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteeConfig _$GiteeConfigFromJson(Map<String, dynamic> json) => GiteeConfig(
      owner: json['owner'] as String,
      path: json['path'] as String,
      repo: json['repo'] as String,
      token: json['token'] as String,
      customUrl: json['customUrl'] as String,
      branch: json['branch'] as String,
    );

Map<String, dynamic> _$GiteeConfigToJson(GiteeConfig instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'path': instance.path,
      'repo': instance.repo,
      'token': instance.token,
      'customUrl': instance.customUrl,
      'branch': instance.branch,
    };
