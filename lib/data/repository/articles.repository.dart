
import 'package:dio/dio.dart';
import 'package:technical_test/domain/models/article/article.cache.dart';
import 'package:technical_test/domain/models/article/article.model.dart';

abstract class IArticleRepository {

  Future<List<Article>?> get({bool isRefreshing = false});

} 

class ArticleRepository extends IArticleRepository {
  Dio dio;
  ArticlesCache articlesCache;

  ArticleRepository({ required this.dio, required this.articlesCache });


  @override
  Future<List<Article>?> get({bool isRefreshing = false}) async {

    final ArticlesCache cache = await articlesCache.getCache();
    if(cache.isArticlesListRetrieved && !isRefreshing){
      return cache.articles;
    }

    final res = await dio.get(
      '/search_by_date?query=mobile'
    );

    if( res.statusCode != 200 && res.statusCode != 200 ) return null;
    final articleList = ArticlesList.fromJson( res.data ).articles;
    articlesCache.setNewArticles(newArticles: articleList);
    articleList.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return articleList;
  }

}