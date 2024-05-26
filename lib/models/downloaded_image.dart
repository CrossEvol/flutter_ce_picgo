import 'package:json_annotation/json_annotation.dart';

part 'downloaded_image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DownloadedImage {
  final int id;
  final String path;
  final String name;
  final String sha;

  final DateTime downloadedAt;

  const DownloadedImage({
    required this.id,
    required this.path,
    required this.name,
    required this.sha,
    required this.downloadedAt,
  });

  factory DownloadedImage.fromJson(Map<String, dynamic> json) =>
      _$DownloadedImageFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadedImageToJson(this);
}
