import 'package:flutter_news_api/src/data/model/news_response.dart';
import 'package:flutter_news_api/src/data/remote/remote_data_source.dart';
import 'package:flutter_news_api/src/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{
  final RemoteDataSource _remoteDataSource;

  SearchRepositoryImpl(this._remoteDataSource);

  @override
  Future<NewsResponse> searchNews({required String params}) {
    return _remoteDataSource.getSearchNews(params);
  }

}