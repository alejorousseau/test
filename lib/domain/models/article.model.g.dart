// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HitsListAdapter extends TypeAdapter<HitsList> {
  @override
  final int typeId = 0;

  @override
  HitsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HitsList(
      hits: (fields[0] as List).cast<Hit>(),
    );
  }

  @override
  void write(BinaryWriter writer, HitsList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.hits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HitsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HitAdapter extends TypeAdapter<Hit> {
  @override
  final int typeId = 1;

  @override
  Hit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hit(
      createdAt: fields[0] as DateTime,
      author: fields[1] as String,
      storyTitle: fields[2] as String,
      storyUrl: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Hit obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.storyTitle)
      ..writeByte(3)
      ..write(obj.storyUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
