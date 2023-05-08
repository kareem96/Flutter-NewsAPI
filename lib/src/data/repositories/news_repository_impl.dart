import 'package:flutter_news_api/src/data/model/news_response.dart';
import 'package:flutter_news_api/src/data/remote/remote_data_source.dart';
import 'package:flutter_news_api/src/domain/repositories/news_repository.dart';
import 'package:http/http.dart';

class NewsRepositoryImpl implements NewsRepository{
  final RemoteDataSource _remoteDataSource;
  NewsRepositoryImpl(this._remoteDataSource);

  @override
  Future<NewsResponse> getListNews() async{
    // TODO: implement getListNews
    return await _remoteDataSource.getTopHeadLines(Client());
  }

}