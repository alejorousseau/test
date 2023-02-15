import 'package:hive/hive.dart';
import 'package:technical_test/domain/models/article/article.model.dart';

part 'article.cache.g.dart';

const String articlesCache = 'articlesCache';

@HiveType(typeId: 18)
class ArticlesCache {
  @HiveField(0, defaultValue: [])
  final List<Article> articles;

  @HiveField(1, defaultValue: false)
  final bool isArticlesListRetrieved;

  ArticlesCache({
    this.articles = const [],
    this.isArticlesListRetrieved = false,
  });

  static Future<Box> getBox() async {
    return await Hive.openBox<ArticlesCache>(articlesCache);
  }

  Future<ArticlesCache> getCache() async {
    final Box cacheBox = await getBox();
    final ArticlesCache cache = cacheBox.get(
      articlesCache,
      defaultValue: ArticlesCache(),
    );
    return cache;
  }

  _updateCache() async {
    final Box cacheBox = await getBox();
    cacheBox.put(articlesCache, this);
  }

  Future<ArticlesCache> setNewArticles({
    required List<Article> newArticles,
  }) async {
    final ArticlesCache cache = ArticlesCache(
      articles: newArticles,
      isArticlesListRetrieved: true,
    );
    await cache._updateCache();
    return cache;
  }
}
