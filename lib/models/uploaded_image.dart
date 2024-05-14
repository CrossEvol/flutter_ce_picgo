import 'package:flutter_ce_picgo/models/enums/uploaded_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'uploaded_image.g.dart';


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

  UploadedImage copyWith({
    int? id,
    String? filepath,
    String? storageType,
    String? url,
    String? name,
    UploadState? state,
    DateTime? createTime,
    DateTime? uploadTime,
  }) {
    return UploadedImage(
      id: id ?? this.id,
      filepath: filepath ?? this.filepath,
      storageType: storageType ?? this.storageType,
      url: url ?? this.url,
      name: name ?? this.name,
      state: state ?? this.state,
      createTime: createTime ?? this.createTime,
      uploadTime: uploadTime ?? this.uploadTime,
    );
  }
}
