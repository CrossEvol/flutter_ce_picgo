import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'uploaded_state.g.dart';

@JsonEnum()
@HiveType(typeId: 2)
enum UploadState {
  @HiveField(0)
  uploading,
  @HiveField(1)
  saving,
  @HiveField(2)
  completed,
  @HiveField(3)
  uploadFailed,
  @HiveField(4)
  saveFailed,
  @HiveField(5)
  unknown, // mark for 422 client error
}
