@Deprecated('use the enum in replace of the static constants')
abstract class DeprecatedImageStorageType {
  static const github = 'github';

  static const gitee = 'gitee';
}

enum ImageStorageType { github, gitee }
