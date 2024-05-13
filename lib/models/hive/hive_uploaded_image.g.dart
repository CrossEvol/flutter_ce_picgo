// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_uploaded_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUploadedImageAdapter extends TypeAdapter<HiveUploadedImage> {
  @override
  final int typeId = 1;

  @override
  HiveUploadedImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUploadedImage(
      id: fields[0] as int,
      filepath: fields[1] as String,
      storageType: fields[2] as String,
      url: fields[3] as String,
      name: fields[4] as String,
      state: fields[5] as UploadState,
      createTime: fields[6] as DateTime,
      uploadTime: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUploadedImage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.filepath)
      ..writeByte(2)
      ..write(obj.storageType)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.createTime)
      ..writeByte(7)
      ..write(obj.uploadTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUploadedImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
