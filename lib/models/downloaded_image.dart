import 'package:flutter_ce_picgo/common/interfaces/interface.dart';
import 'package:json_annotation/json_annotation.dart';

part 'downloaded_image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DownloadedImage implements IDownload{
  final int id;
  final String localUrl;
  final String remoteUrl;
  final String name; // this is the unique identifier
  final String sha;

  final DateTime createdAt;

  factory DownloadedImage.fromJson(Map<String, dynamic> json) =>
      _$DownloadedImageFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadedImageToJson(this);

  const DownloadedImage({
    required this.id,
    required this.localUrl,
    required this.remoteUrl,
    required this.name,
    required this.sha,
    required this.createdAt,
  });
}
