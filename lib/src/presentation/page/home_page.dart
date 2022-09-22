import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/src/presentation/page/search_page.dart';
import 'package:flutter_news_api/src/utils/state_result.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';
import '../widgets/list_card_news.dart';
import 'article_web.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [buildHeader(), buildListNews()],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Parent(
      style: ParentStyle()
        ..margin(
          vertical: 10,
          horizontal: 16,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Flutter News API",
            style: TextStyle(
                fontSize: 18,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
          
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            child: Parent(
              style: ParentStyle()
                ..background.color(const Color.fromRGBO(240, 238, 248, 1))
                ..padding(horizontal: 8, vertical: 8)
                ..borderRadius(all: 8)
                ..margin(bottom: 10),
              child: Row(
                children: const [
                  Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Search..",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListNews() {
    return Expanded(
      child: Consumer<HomeProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.wifi_off,
                    size: 50,
                  ),
                  Text(
                    "Gagal memuat data \n harap perikasa koneksi internet Anda!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
                itemCount: state.newsResponse.totalResults,
                itemBuilder: (context, index) {
                  final response = state.newsResponse.news[index];
                  return ListCardNews(
                      pictureId: response.urlToImage,
                      title: response.title,
                      author: response.author,
                      publishedAt: response.publishedAt,
                      description: response.description,
                      onPress: (){
                        Navigator.pushNamed(context, ArticleWebView.routeName,
                            arguments: response.url);
                        // Navigator.pushNamed(context, DetailPage.routeName, arguments: response);
                      }
                  );
                }
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}
