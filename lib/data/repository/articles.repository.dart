
import 'package:dio/dio.dart';
import 'package:technical_test/domain/models/article.model.dart';

abstract class IArticleRepository {

  Future<List<Article>?> get();

} 

class ArticleRepository extends IArticleRepository {
  Dio dio;

  ArticleRepository({ required this.dio });

  @override
  Future<List<Article>?> get() async {
    final res = await dio.get(
      '/search_by_date?query=mobile'
    );

    if( res.statusCode != 200 && res.statusCode != 200 ) return null;

    final articleList = ArticlesList.fromJson( res.data );
    return articleList.articles;
  }

}