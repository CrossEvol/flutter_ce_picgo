import 'package:json_annotation/json_annotation.dart';

import 'file.dart';

part 'gitee_content.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: true)
class GiteeContent {
  String name;
  String path;
  String sha;
  int size;
  String url;
  String htmlUrl;
  String downloadUrl;
  FileContentType type;

  @JsonKey(name: '_links')
  Map<GiteeLinkType, String> links;

  GiteeContent({
    required this.name,
    required this.path,
    required this.sha,
    required this.size,
    required this.url,
    required this.htmlUrl,
    required this.downloadUrl,
    required this.type,
    required this.links,
  });

  factory GiteeContent.fromJson(Map<String, dynamic> json) =>
      _$GiteeContentFromJson(json);

  Map<String, dynamic> toJson() => _$GiteeContentToJson(this);
}

@JsonEnum()
enum GiteeLinkType { self, html }
