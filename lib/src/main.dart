import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/src/data/model/news.dart';
import 'package:flutter_news_api/src/data/remote/remote_data_source.dart';
import 'package:flutter_news_api/src/presentation/page/article_web.dart';
import 'package:flutter_news_api/src/presentation/page/detail_page.dart';
import 'package:flutter_news_api/src/presentation/page/home_page.dart';
import 'package:flutter_news_api/src/presentation/page/search_page.dart';
import 'package:flutter_news_api/src/presentation/providers/home_provider.dart';
import 'package:flutter_news_api/src/presentation/providers/search_provider.dart';
import 'package:flutter_news_api/src/utils/navigation.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(
            create: (_) => HomeProvider(remoteDataSource: _remoteDataSource),
          ),
          ChangeNotifierProvider<SearchProvider>(
            create: (_) => SearchProvider(remoteDataSource: _remoteDataSource),
          ),
        ],
        child: MaterialApp(
          title: "Flutter News API",
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return CupertinoTheme(
                data: const CupertinoThemeData(
                  brightness: Brightness.light,
                ),
                child: Material(
                  child: child,
                ));
          },
          navigatorKey: navigatorKey,
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (context) => const HomePage(),
            SearchPage.routeName: (context) => const SearchPage(),
            DetailPage.routeName: (context) => DetailPage(
                news: ModalRoute.of(context)?.settings.arguments as News),
            ArticleWebView.routeName: (context) => ArticleWebView(
                url: ModalRoute.of(context)?.settings.arguments as String)
          },
        ),
      );
}
