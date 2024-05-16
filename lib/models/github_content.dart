import 'package:json_annotation/json_annotation.dart';

import 'file.dart';

part 'github_content.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: true)
class GithubContent {
  String name;
  String path;
  String sha;
  String? content;
  String? encoding;
  int size;
  String url;
  String htmlUrl;
  String gitUrl;
  String downloadUrl;
  FileContentType type;

  @JsonKey(name: '_links')
  Map<GithubLinkType, String> links;

  GithubContent({
    required this.name,
    required this.path,
    required this.sha,
    required this.size,
    required this.url,
    required this.htmlUrl,
    required this.gitUrl,
    required this.downloadUrl,
    required this.type,
    required this.links,
    this.content,
    this.encoding,
  });

  factory GithubContent.fromJson(Map<String, dynamic> json) =>
      _$GithubContentFromJson(json);

  Map<String, dynamic> toJson() => _$GithubContentToJson(this);
}

@JsonEnum()
enum GithubLinkType { self, git, html }
