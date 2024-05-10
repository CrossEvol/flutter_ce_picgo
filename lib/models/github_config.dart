import 'package:json_annotation/json_annotation.dart';

part 'github_config.g.dart';

@JsonSerializable()
class GithubConfig {
  String branch;
  String customUrl;
  String path;
  String repo;
  String token;

  GithubConfig.none()
      : branch = "",
        customUrl = "",
        path = "",
        repo = "",
        token = "";

  GithubConfig(
      {required this.branch,
      required this.customUrl,
      required this.path,
      required this.repo,
      required this.token});

  factory GithubConfig.fromJson(Map<String, dynamic> json) =>
      _$GithubConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GithubConfigToJson(this);
}
