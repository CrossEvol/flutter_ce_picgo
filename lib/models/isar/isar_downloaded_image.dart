import 'package:flutter_ce_picgo/models/downloaded_image.dart';
import 'package:isar/isar.dart';

part 'isar_downloaded_image.g.dart';

@collection
class IsarDownloadedImage {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String localUrl;

  @Index(type: IndexType.value)
  final String name;

  @Index(type: IndexType.value)
  final String remoteUrl;

  final String sha;

  final DateTime createdAt;

  IsarDownloadedImage({
    required this.localUrl,
    required this.name,
    required this.remoteUrl,
    required this.sha,
    required this.createdAt,
  });
}

extension IsarDownloadedImageExt on IsarDownloadedImage {
  DownloadedImage fromIsarObject() {
    return DownloadedImage(
        id: id,
        localUrl: localUrl,
        remoteUrl: remoteUrl,
        name: name,
        sha: sha,
        createdAt: createdAt);
  }
}

extension DownloadedImageExt on DownloadedImage {
  IsarDownloadedImage toIsarObject() {
    return IsarDownloadedImage(
        localUrl: localUrl,
        name: name,
        remoteUrl: remoteUrl,
        sha: sha,
        createdAt: createdAt);
  }
}
