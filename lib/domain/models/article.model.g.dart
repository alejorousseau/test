// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlesListAdapter extends TypeAdapter<ArticlesList> {
  @override
  final int typeId = 0;

  @override
  ArticlesList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticlesList(
      hits: (fields[0] as List).cast<Article>(),
    );
  }

  @override
  void write(BinaryWriter writer, ArticlesList obj) {
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
      other is ArticlesListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 1;

  @override
  Article read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Article(
      createdAt: fields[0] as DateTime,
      author: fields[1] as String,
      storyTitle: fields[2] as String,
      storyUrl: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
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
      other is ArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
