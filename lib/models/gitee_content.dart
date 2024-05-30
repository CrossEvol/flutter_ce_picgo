import 'package:flutter_ce_picgo/common/interfaces/interface.dart';
import 'package:json_annotation/json_annotation.dart';

import 'file.dart';

part 'gitee_content.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: true)
class GiteeContent implements IContent {
  String name;
  String path;
  String? content;
  String? encoding;
  String sha;
  int size;
  String url;
  String htmlUrl;
  String downloadUrl;
  FileContentType type;

  @JsonKey(name: '_links')
  Map<GiteeLinkType, String> links;

  factory GiteeContent.fromJson(Map<String, dynamic> json) =>
      _$GiteeContentFromJson(json);

  Map<String, dynamic> toJson() => _$GiteeContentToJson(this);

  GiteeContent({
    required this.name,
    required this.path,
    this.content,
    this.encoding,
    required this.sha,
    required this.size,
    required this.url,
    required this.htmlUrl,
    required this.downloadUrl,
    required this.type,
    required this.links,
  });
}

@JsonEnum()
enum GiteeLinkType { self, html }
