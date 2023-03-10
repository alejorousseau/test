import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart';

import 'package:technical_test/data/common/dio.client.dart';
import 'package:technical_test/data/repository/articles.repository.dart';
import 'package:technical_test/domain/models/article/article.cache.dart';
import 'package:technical_test/domain/models/article/article.model.dart';
import 'package:technical_test/ui/screens/home/bloc/home_bloc.dart';
import 'package:technical_test/ui/screens/home/home.screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
  ));

  Hive.init((await getApplicationDocumentsDirectory()).path);

  Hive.registerAdapter(ArticlesListAdapter());
  Hive.registerAdapter(ArticlesCacheAdapter());
  Hive.registerAdapter(ArticleAdapter());

  ArticlesCache.getBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ArticleRepository(dio: DioClient.build(), articlesCache: ArticlesCache()),
    
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create:(context) => HomeBloc(articleRepo: RepositoryProvider.of<ArticleRepository>(context)))
        ],
        child: MaterialApp(
          title: 'Test Eskuad',
          debugShowCheckedModeBanner: false,
          
          theme: ThemeData(
            useMaterial3: true,
          ),  
              
          home: const Scaffold(
            body: HomeScreen()
          ),
        ),
      ),
    );
  }
}
