// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UploadStateAdapter extends TypeAdapter<UploadState> {
  @override
  final int typeId = 2;

  @override
  UploadState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UploadState.uploading;
      case 1:
        return UploadState.saving;
      case 2:
        return UploadState.completed;
      case 3:
        return UploadState.uploadFailed;
      case 4:
        return UploadState.saveFailed;
      case 5:
        return UploadState.unknown;
      default:
        return UploadState.uploading;
    }
  }

  @override
  void write(BinaryWriter writer, UploadState obj) {
    switch (obj) {
      case UploadState.uploading:
        writer.writeByte(0);
        break;
      case UploadState.saving:
        writer.writeByte(1);
        break;
      case UploadState.completed:
        writer.writeByte(2);
        break;
      case UploadState.uploadFailed:
        writer.writeByte(3);
        break;
      case UploadState.saveFailed:
        writer.writeByte(4);
        break;
      case UploadState.unknown:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
