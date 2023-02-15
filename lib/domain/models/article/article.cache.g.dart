// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlesCacheAdapter extends TypeAdapter<ArticlesCache> {
  @override
  final int typeId = 18;

  @override
  ArticlesCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticlesCache(
      articles: fields[0] == null ? [] : (fields[0] as List).cast<Article>(),
      isArticlesListRetrieved: fields[1] == null ? false : fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ArticlesCache obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.articles)
      ..writeByte(1)
      ..write(obj.isArticlesListRetrieved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticlesCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
