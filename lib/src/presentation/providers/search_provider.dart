import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/src/data/model/news_response.dart';
import 'package:flutter_news_api/src/data/remote/remote_data_source.dart';
import 'package:flutter_news_api/src/utils/state_result.dart';

class SearchProvider extends ChangeNotifier{
  final RemoteDataSource remoteDataSource;
  SearchProvider({
    required this.remoteDataSource
  }){
    fetchGetSearch(query);
  }

  String _query = "";
  String get query => _query;

  String _message = "";
  String get message => _message;

  NewsResponse? _newsResponse;
  NewsResponse? get result => _newsResponse;

  ResultState? _state;
  ResultState? get state => _state;

  Future<dynamic> fetchGetSearch(String query) async{
    try{
      _state = ResultState.loading;
      _query = query;
      final newsSearch = await remoteDataSource.getSearchNews(query);
      if(newsSearch.news.isEmpty){
        _state = ResultState.noData;
        notifyListeners();
        return _message = "News tidak dapat ditemukan!";
      }else{
        _state = ResultState.hasData;
        notifyListeners();
        return _newsResponse = newsSearch;
      }
    }catch(e){
      _state = ResultState.error;
      notifyListeners();
      return _message = "Error -> $e";
    }
  }
  /*bool isLoading = false;
  List<News> news = [];*/
  /*getSearch(context, query) async{
    isLoading = true;
    news = await remoteDataSource.getSearch(query);
    isLoading = false;

    notifyListeners();
  }*/
}