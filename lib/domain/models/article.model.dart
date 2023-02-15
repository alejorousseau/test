
// Endpoint: https://hn.algolia.com/api/v1/search_by_date?query=mobile
// res -> hits -> object -> {created_at, story_title, author, story_url (optional)}

import 'dart:convert';

import 'package:hive/hive.dart';

part 'article.model.g.dart';

@HiveType(typeId: 0)
class ArticlesList {
    ArticlesList({
        required this.hits,
    });

    @HiveField(0)
    List<Article> hits;

    factory ArticlesList.fromRawJson(String str) => ArticlesList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ArticlesList.fromJson(Map<String, dynamic> json) => ArticlesList(
        hits: List<Article>.from(json["hits"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
    };
}

@HiveType(typeId: 1)
class Article {
    Article({
        required this.createdAt,
        required this.author,
        required this.storyTitle,
        required this.storyUrl,
    });

    @HiveField(0)
    DateTime createdAt;
    @HiveField(1)
    String author;
    @HiveField(2)
    String storyTitle;
    @HiveField(3)
    String? storyUrl;

    factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        createdAt: DateTime.parse(json["created_at"]),
        author: json["author"] ?? '',
        storyTitle: json["story_title"] ?? '',
        storyUrl: json["story_url"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "author": author,
        "story_title": storyTitle,
        "story_url": storyUrl,
    };
}