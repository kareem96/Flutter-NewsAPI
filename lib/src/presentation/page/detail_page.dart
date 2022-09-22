import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/src/data/model/news.dart';

import 'article_web.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';
  final News news;

  const DetailPage({Key? key, required this.news}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [buildHeader(), buildContent()],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Parent(
            style: ParentStyle()..margin(vertical: 16, horizontal: 16),
            child: Flexible(
              child: Row(
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Detail",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
            )),
        Hero(
            tag: widget.news.title ?? "",
            child: Image.network(
              widget.news.urlToImage ??
                  "https://images.wsj.net/im-568851/social",
              width: double.maxFinite,
              height: 300,
              fit: BoxFit.cover,
            ))
      ],
    );
  }

  Widget buildContent() {
    return Parent(
      style: ParentStyle()..padding(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.news.title ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(Icons.people),
              const SizedBox(
                height: 10,
              ),
              Flexible(child: Text(widget.news.author ?? "")),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(widget.news.content ?? ""),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                print(widget.news.url);
                Navigator.pushNamed(context, ArticleWebView.routeName,
                    arguments: widget.news.url);
              },
              child: const Text('Go to Web view'))
        ],
      ),
    );
  }
}
