import 'package:hive/hive.dart';

import '../enums/uploaded_state.dart';
import '../uploaded_image.dart';

part 'hive_uploaded_image.g.dart';

@HiveType(typeId: 1)
class HiveUploadedImage {
  @HiveField(0)
  int id;

  @HiveField(1)
  String filepath;

  @HiveField(2)
  String storageType;

  @HiveField(3)
  String url;

  @HiveField(4)
  String name;

  @HiveField(5)
  UploadState state;

  @HiveField(6)
  DateTime createTime;

  @HiveField(7)
  DateTime uploadTime;

  HiveUploadedImage({
    required this.id,
    required this.filepath,
    required this.storageType,
    required this.url,
    required this.name,
    required this.state,
    required this.createTime,
    required this.uploadTime,
  });
}

extension HiveUploadedImageExtension on HiveUploadedImage {
  UploadedImage fromHiveObject() {
    return UploadedImage(
        id: id,
        filepath: filepath,
        storageType: storageType,
        url: url,
        name: name,
        state: state,
        createTime: createTime,
        uploadTime: uploadTime);
  }
}

extension UploadedImageExtension on UploadedImage {
  HiveUploadedImage toHiveObject() {
    return HiveUploadedImage(
        id: id,
        filepath: filepath,
        storageType: storageType,
        url: url,
        name: name,
        state: state,
        createTime: createTime,
        uploadTime: uploadTime);
  }
}
