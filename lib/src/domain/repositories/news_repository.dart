import 'package:flutter_news_api/src/data/model/news_response.dart';

abstract class NewsRepository{
  Future<NewsResponse> getListNews();
}