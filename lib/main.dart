import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:technical_test/data/common/dio.client.dart';
import 'package:technical_test/data/repository/articles.repository.dart';
import 'package:technical_test/domain/models/article.model.dart';
import 'package:technical_test/ui/screens/home/bloc/home_bloc.dart';
import 'package:technical_test/ui/screens/home/home.screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await getApplicationDocumentsDirectory()).path);

  Hive.registerAdapter(ArticlesListAdapter());
  Hive.registerAdapter(ArticleAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder:(lightDynamic, darkDynamic) {

        return RepositoryProvider(
          create: (context) => ArticleRepository(dio: DioClient.build()),
        
          child: MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(create:(context) => HomeBloc(articleRepo: RepositoryProvider.of<ArticleRepository>(context)))
            ],
            child: MaterialApp(
              title: 'Test Eskuad',
              debugShowCheckedModeBanner: false,
                  
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightDynamic 
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkDynamic 
              ),
                  
              home: const Scaffold(
                body: HomeScreen()
              ),
            ),
          ),
        );
      }, 
    );
  }
}
