// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitee_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteeContent _$GiteeContentFromJson(Map<String, dynamic> json) => GiteeContent(
      name: json['name'] as String,
      path: json['path'] as String,
      content: json['content'] as String?,
      encoding: json['encoding'] as String?,
      sha: json['sha'] as String,
      size: (json['size'] as num).toInt(),
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      downloadUrl: json['download_url'] as String,
      type: $enumDecode(_$FileContentTypeEnumMap, json['type']),
      links: (json['_links'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$GiteeLinkTypeEnumMap, k), e as String),
      ),
    );

Map<String, dynamic> _$GiteeContentToJson(GiteeContent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'content': instance.content,
      'encoding': instance.encoding,
      'sha': instance.sha,
      'size': instance.size,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'download_url': instance.downloadUrl,
      'type': _$FileContentTypeEnumMap[instance.type]!,
      '_links':
          instance.links.map((k, e) => MapEntry(_$GiteeLinkTypeEnumMap[k]!, e)),
    };

const _$FileContentTypeEnumMap = {
  FileContentType.file: 'file',
  FileContentType.dir: 'dir',
};

const _$GiteeLinkTypeEnumMap = {
  GiteeLinkType.self: 'self',
  GiteeLinkType.html: 'html',
};
