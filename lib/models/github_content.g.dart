// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubContent _$GithubContentFromJson(Map<String, dynamic> json) =>
    GithubContent(
      name: json['name'] as String,
      path: json['path'] as String,
      sha: json['sha'] as String,
      size: (json['size'] as num).toInt(),
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      gitUrl: json['git_url'] as String,
      downloadUrl: json['download_url'] as String,
      type: $enumDecode(_$FileContentTypeEnumMap, json['type']),
      links: (json['_links'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$GithubLinkTypeEnumMap, k), e as String),
      ),
      content: json['content'] as String?,
      encoding: json['encoding'] as String?,
    );

Map<String, dynamic> _$GithubContentToJson(GithubContent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'sha': instance.sha,
      'content': instance.content,
      'encoding': instance.encoding,
      'size': instance.size,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'git_url': instance.gitUrl,
      'download_url': instance.downloadUrl,
      'type': _$FileContentTypeEnumMap[instance.type]!,
      '_links': instance.links
          .map((k, e) => MapEntry(_$GithubLinkTypeEnumMap[k]!, e)),
    };

const _$FileContentTypeEnumMap = {
  FileContentType.file: 'file',
  FileContentType.dir: 'dir',
};

const _$GithubLinkTypeEnumMap = {
  GithubLinkType.self: 'self',
  GithubLinkType.git: 'git',
  GithubLinkType.html: 'html',
};
