import 'package:flutter_news_api/src/data/model/news.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<News>? news;

  NewsResponse({ this.news,  this.status,  this.totalResults});

  factory NewsResponse.formJson(Map<String, dynamic> json) => NewsResponse(
      totalResults: json["totalResults"],
      status: json["status"],
      news: List<News>.from(
        json['articles'].map((x) => News.fromJson(x)),
      ));
}
