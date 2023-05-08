import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/src/presentation/widgets/list_card_news.dart';
import 'package:provider/provider.dart';

import '../../utils/state_result.dart';
import '../providers/search_provider.dart';
import 'article_web.dart';

/*class SearchPage extends StatefulWidget {
  static const routeName = '/page_search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String queries = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            newsList(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(){
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        Consumer<SearchProvider>(
          builder: (context, state, _){
            return Expanded(
              child: Parent(
                style: ParentStyle()
                  ..background.color(const Color.fromRGBO(240, 238, 248, 1))
                  ..borderRadius(all: 8)
                  ..margin(vertical: 13, right: 16),
                child: TextField(
                  controller: _controller,
                  onChanged: (String value){
                    setState(() {
                      queries = value;
                    });
                    if(value != ""){
                      state.fetchGetSearch(value);
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Search..",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(13),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: InkWell(
                        onTap: (){
                          if(queries != ""){
                            _controller.clear();
                            state.fetchGetSearch("");
                            setState(() {
                              queries = "";
                            });
                          }
                        },
                        child: const Icon(
                          Icons.close_outlined,
                          color: Colors.grey,
                        ),
                      )
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget newsList(){
    return Expanded(
      child:
      Consumer<SearchProvider>(
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
                  Text(
                    "Gagal memuat data \n Silahkan cari berita anda!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            );
          } else if (state.state == ResultState.noData) {
            return const Center(
              child: Text(""),
            );
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
                itemCount: state.result?.news.length,
                itemBuilder: (context, index) {
                  final response = state.result!.news[index];
                  return ListCardNews(
                      pictureId: response.urlToImage,
                      title: response.title,
                      author: response.author,
                      publishedAt: response.publishedAt,
                      description: response.description,
                      onPress: (){
                        // Navigator.pushNamed(context, DetailPage.routeName, arguments: response);
                        Navigator.pushNamed(context, ArticleWebView.routeName,
                            arguments: response.url);
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
}*/
