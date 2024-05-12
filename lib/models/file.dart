import 'package:json_annotation/json_annotation.dart';

/// 文件类型
@JsonEnum()
enum FileContentType {
  /// 文件
  file,

  /// 文件夹
  dir,
}
