import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/src/data/model/news_response.dart';
import 'package:flutter_news_api/src/data/remote/remote_data_source.dart';
import 'package:flutter_news_api/src/utils/state_result.dart';
import 'package:http/http.dart';

class HomeProvider extends ChangeNotifier{
  RemoteDataSource remoteDataSource;
  HomeProvider({
    required this.remoteDataSource}){
    fetchTopHeadLines();
  }

  String _message = "";
  String get message => _message;

  late ResultState _state;
  ResultState get state => _state;

  late NewsResponse _newsResponse;
  NewsResponse get newsResponse => _newsResponse;

  Future<dynamic> fetchTopHeadLines() async{
    try{
      _state = ResultState.loading;
      notifyListeners();
      final news = await remoteDataSource.getTopHeadLines(Client());
      if(news.news.isEmpty){
        _state = ResultState.noData;
        notifyListeners();
        return _message = "Not Found Data";
      }else{
        _state = ResultState.hasData;
        notifyListeners();
        return _newsResponse = news;
      }
    }catch (e){
      _state = ResultState.error;
      notifyListeners();
      return _message = "Error -> $e";
    }
  }

  /*bool isLoading = false;
  List<News> news = [];*/

  /*getTopHeadLines(context) async{
    isLoading = true;
    news = await remoteDataSource.getTopHeadLines();
    isLoading = false;

    notifyListeners();
  }*/
}