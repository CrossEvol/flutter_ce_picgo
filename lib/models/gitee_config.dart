import 'package:json_annotation/json_annotation.dart';

import '../common/interfaces/interface.dart';

part 'gitee_config.g.dart';

@JsonSerializable()
class GiteeConfig implements IConfig {
  String owner;
  String path;
  String repo;
  String token;
  String customUrl;
  String branch;

  GiteeConfig.none()
      : owner = "",
        path = "",
        repo = "",
        token = "",
        customUrl = "",
        branch = "";

  GiteeConfig({
    required this.owner,
    required this.path,
    required this.repo,
    required this.token,
    required this.customUrl,
    required this.branch,
  });

  factory GiteeConfig.fromJson(Map<String, dynamic> json) =>
      _$GiteeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GiteeConfigToJson(this);
}
