import 'package:json_annotation/json_annotation.dart';

part 'uploaded_image.g.dart';

@JsonEnum()
enum UploadState { uploading, saving, completed, uploadFailed, saveFailed }

@JsonSerializable()
class UploadedImage {
  int id;
  String filepath;
  String storageType;
  String url;
  String name;
  UploadState state;
  DateTime createTime;
  DateTime uploadTime;

  UploadedImage({
    required this.id,
    required this.filepath,
    required this.storageType,
    required this.url,
    required this.name,
    required this.state,
    required this.createTime,
    required this.uploadTime,
  });

  factory UploadedImage.fromJson(Map<String, dynamic> json) =>
      _$UploadedImageFromJson(json);

  Map<String, dynamic> toJson() => _$UploadedImageToJson(this);
}
