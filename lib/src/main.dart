import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/src/intializer.dart';
import 'package:flutter_news_api/src/routes.dart';
import 'package:get/get.dart';
import 'navigation.dart';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );*/
  await Initializer.init();
  var initialRoute = await Routes.initialRoute;
  runApp(MyApp(initialRoute));
}
class MyApp extends StatelessWidget{
  final String initialRoute;
  MyApp(this.initialRoute);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

/*class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}*/

/*class _MyAppState extends State<MyApp> {
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
}*/
