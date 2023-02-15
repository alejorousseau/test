
// Endpoint: https://hn.algolia.com/api/v1/search_by_date?query=mobile
// res -> hits -> object -> {created_at, story_title, author, story_url (optional)}

import 'dart:convert';

class HitsList {
    HitsList({
        required this.hits,
    });

    List<Hit> hits;

    factory HitsList.fromRawJson(String str) => HitsList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HitsList.fromJson(Map<String, dynamic> json) => HitsList(
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
    };
}

class Hit {
    Hit({
        required this.createdAt,
        required this.author,
        required this.storyTitle,
        required this.storyUrl,
    });

    DateTime createdAt;
    String author;
    String storyTitle;
    String? storyUrl;

    factory Hit.fromRawJson(String str) => Hit.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Hit.fromJson(Map<String, dynamic> json) => Hit(
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