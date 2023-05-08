import 'package:flutter_news_api/src/data/model/news_response.dart';
import 'package:flutter_news_api/src/domain/repositories/news_repository.dart';

class NewsUseCase{
  final NewsRepository _newsRepository;
  NewsUseCase(this._newsRepository);

 Future<NewsResponse> call(){
   return _newsRepository.getListNews();
 }
}