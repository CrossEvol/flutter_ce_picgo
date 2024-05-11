// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_image_storage_setting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveImageStorageSettingAdapter
    extends TypeAdapter<HiveImageStorageSetting> {
  @override
  final int typeId = 0;

  @override
  HiveImageStorageSetting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveImageStorageSetting(
      id: fields[0] as int,
      type: fields[1] as String,
      name: fields[2] as String,
      config: fields[3] as String,
      path: fields[4] as String,
      visible: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveImageStorageSetting obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.config)
      ..writeByte(4)
      ..write(obj.path)
      ..writeByte(5)
      ..write(obj.visible);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveImageStorageSettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
