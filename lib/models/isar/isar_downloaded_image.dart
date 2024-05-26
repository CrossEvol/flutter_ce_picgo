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
