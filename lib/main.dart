import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:technical_test/domain/models/article.model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await getApplicationDocumentsDirectory()).path);

  Hive.registerAdapter(HitsListAdapter());
  Hive.registerAdapter(HitAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder:(lightDynamic, darkDynamic) {
        return MaterialApp(
          title: 'Test',
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightDynamic 
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkDynamic 
          ),

          home: Scaffold(
            body: Container()
          ),
        );
      }, 
    );
  }
}
