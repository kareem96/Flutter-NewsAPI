import 'package:flutter_news_api/src/data/model/news_response.dart';
import 'package:flutter_news_api/src/domain/repositories/search_repository.dart';

class SearchUseCase{
  final SearchRepository _repository;

  const SearchUseCase({required SearchRepository repository}) : _repository = repository;

  Future<NewsResponse> call({required String params}) async{
    return await _repository.searchNews(params: params);
  }
}