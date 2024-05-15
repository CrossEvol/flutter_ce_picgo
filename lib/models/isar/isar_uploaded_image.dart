import 'package:flutter_ce_picgo/models/uploaded_image.dart';
import 'package:isar/isar.dart';

import '../enums/uploaded_state.dart';

part 'isar_uploaded_image.g.dart';

@collection
class IsarUploadedImage {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.hash)
  String filepath;

  @Index(type: IndexType.value)
  String storageType;

  String url;

  @Index(type: IndexType.hash)
  String name;

  @Enumerated(EnumType.name)
  UploadState state;

  DateTime createTime;

  DateTime uploadTime;

  IsarUploadedImage({
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

extension IsarUploadedImageExtension on IsarUploadedImage {
  UploadedImage fromIsarObject() {
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
  IsarUploadedImage toIsarObject() {
    return IsarUploadedImage(
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
