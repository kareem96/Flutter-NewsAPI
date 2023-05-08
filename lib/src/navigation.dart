import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/src/config.dart';
import 'package:flutter_news_api/src/presentation/bindings/news_binding.dart';
import 'package:flutter_news_api/src/presentation/bindings/search_binding.dart';
import 'package:flutter_news_api/src/presentation/page/search/search_screen.dart';
import 'package:flutter_news_api/src/routes.dart';
import 'package:get/get.dart';
import 'presentation/page/home/home_screen.dart';

class EnvironmentBadge extends StatelessWidget{
  final Widget child;
  EnvironmentBadge({required this.child});

  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION ? Banner(
        message: env!,
        location: BannerLocation.topStart,
      child: child,
    ): SizedBox(child: child,);
  }
}

class Nav{
  static List<GetPage> routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: NewsBinding()
    ),
    GetPage(
        name: Routes.SEARCH,
        page: () => SearchScreen(),
        binding: SearchBindings()
    ),
  ];
}