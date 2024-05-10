// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubConfig _$GithubConfigFromJson(Map<String, dynamic> json) => GithubConfig(
      branch: json['branch'] as String,
      customUrl: json['customUrl'] as String,
      path: json['path'] as String,
      repo: json['repo'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$GithubConfigToJson(GithubConfig instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'customUrl': instance.customUrl,
      'path': instance.path,
      'repo': instance.repo,
      'token': instance.token,
    };
