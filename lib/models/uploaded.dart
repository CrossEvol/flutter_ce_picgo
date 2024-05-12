import 'package:json_annotation/json_annotation.dart';

part 'uploaded.g.dart';

@JsonSerializable()
class Uploaded {
  int id;
  String path;
  String type;
  String info;

  Uploaded({
    required this.id,
    required this.path,
    required this.type,
    required this.info,
  });

  factory Uploaded.fromJson(Map<String, dynamic> json) =>
      _$UploadedFromJson(json);

  Map<String, dynamic> toJson() => _$UploadedToJson(this);
}
