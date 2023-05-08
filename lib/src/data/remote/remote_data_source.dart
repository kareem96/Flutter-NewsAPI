import 'dart:convert';
import 'package:flutter_news_api/src/data/model/news_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class RemoteDataSource{
  final GetConnect _connect;
  static const baseUrl = "https://newsapi.org/v2/";
  static const apiKey = "7fd3482b6c1f45f2a26c3b3c49ad1434";
  RemoteDataSource({required GetConnect connect}): _connect = connect;
  // final Dio dio = Dio();

  ///GET TOP HEADLINES
  Future<NewsResponse> getTopHeadLines(http.Client client) async{
    final response = await client.get(Uri.parse(baseUrl + 'top-headlines?sources=espn&apiKey=$apiKey'));
    try{
      if(response.statusCode == 200){
        return NewsResponse.formJson(json.decode(response.body));
      }else{
        throw Exception("Failed to load top headlinese");
      }
    }catch(e){
      rethrow;
    }
  }

  ///GET SEARCH
  Future<NewsResponse> getSearchNews(String query) async{
    final response = await http.get(Uri.parse(baseUrl + 'everything?q=$query&apiKey=$apiKey'));
    try{
      if(response.statusCode == 200){
        return NewsResponse.formJson(json.decode(response.body));
      }else{
        // throw Exception("Failed to load search");
        throw "${response.statusCode}";
      }
    }catch(e){
      rethrow;
    }
  }
}