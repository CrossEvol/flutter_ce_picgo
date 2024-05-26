import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:isar/isar.dart';

part 'isar_downloaded_image.g.dart';

@collection
class IsarDownloadedImage {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String path;

  @Index(type: IndexType.value)
  final String name;

  final String sha;

  final DateTime downloadedAt;

  IsarDownloadedImage({
    required this.path,
    required this.name,
    required this.sha,
    required this.downloadedAt,
  });
}

extension IsarDownloadedImageExt on IsarDownloadedImage {
  DownloadedImage fromIsarObject() {
    return DownloadedImage(
        id: id, path: path, name: name, sha: sha, downloadedAt: downloadedAt);
  }
}

extension DownloadedImageExt on DownloadedImage {
  IsarDownloadedImage toIsarObject() {
    return IsarDownloadedImage(
        path: path, name: name, sha: sha, downloadedAt: downloadedAt);
  }
}
