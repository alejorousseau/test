# Test
## Index

- [Run app](#run-app)
- [Development decisions](#development-decisions)
  - [Architecture](#architecture)
  - [Api response handle](#api-response-handle)
  - [Cache](#cache)
  - [Business Logic](#business-logic)


## Run app
1. Get packages with  `flutter pub get`.
2. Run app in debug mode, `flutter run` (Make sure flutter detects your device).

## Development decisions

#### Architecture
I know that Clean Architecture is the standard then I decided to use this folder structure
```ascii
lib/
├─ data/
│  ├─ repository/
├─ domain/
│  ├─ models/
├─ ui/
│  ├─ widgets/
│  ├─ screens/
```

#### Api response handle

When you see the api response its chaotic and hard to read. So I decided to handle only the data that I will use.
<br/> Data I will use is `{ created_at, author, story_title, story_url }`. 
<br/> *This is extracted from api response:*
```json
{
  "hits": [
    
    {
      "author": " ... ",
      "created_at": " ... ",
      "story_title": " ... ",
      "story_url": " ... ",
    },
  
  ]
}
```

#### Cache

For the cache management I decided to use [*Hive*](https://pub.dev/packages/hive). 
<br/> I created a class where I had methods to handle this cache cleanly 
```dart
@HiveType(typeId: 0)
class ArticlesCache {
  final List<Article> articles;
  final bool isArticlesListRetrieved;

  ArticlesCache({ this.articles = const [], this.isArticlesListRetrieved = false });

  static Future<Box> getBox() async {}

  Future<ArticlesCache> getCache() async {}

  Future<ArticlesCache> setNewArticles({required List<Article> newArticles}) async {}
}
```
<br/> To use Hive its needed to convert models to Hive Syntax using [BuildRunner](https://pub.dev/packages/build_runner) and [HiveDecorators](#hivedecorator-example). This is why there is a `article.model.dart` and a `article.model.g.dart` file, this is generated with [BuildRunner](https://pub.dev/packages/build_runner).

##### HiveDecorator example
```dart
@HiveType(typeId: 0)
class ArticlesCache {
  @HiveField(0, defaultValue: [])
  final List<Article> articles;

```

#### Business Logic
I decided to use the cleanest way to handle logic, [*Repository Pattern*](#repository-pattern) and [*Bloc Pattern*](#bloc-pattern)

##### Repository Pattern
For api calls I decided to use this Pattern, because with this I can Mock api calls.
```dart
abstract class IArticleRepository {
  Future<List<Article>?> get({bool isRefreshing = false});
} 

// Implement Abstract class
class ArticleRepository extends IArticleRepository {
  //TODO implement async get method
}
```

#### Bloc Pattern
For screen Business Logic I decided to use Bloc Pattern because by this way I can make UI agnostic from Business Logic, then just consuming this.
```dart
  // Home Bloc
  class HomeBloc extends Bloc<HomeEvent, HomeState> {}
  
  // Home Event
  abstract class HomeEvent extends Equatable {}
  // Home State
  abstract class HomeState extends Equatable {}
```
