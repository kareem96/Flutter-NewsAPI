import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/src/data/model/news.dart';
import 'package:flutter_news_api/src/domain/use_case/search_use_case.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  ScrollController scrollController = ScrollController();
  final SearchUseCase _searchUseCase;
  RxBool isLoading = false.obs;
  RxList<News> searchNewsItem = <News>[].obs;
  SearchController(this._searchUseCase);

  Future<void> getSearch({required String params}) async{
    isLoading.toggle();
    searchNewsItem.clear();
    params.toLowerCase();
    try{
      final response = await _searchUseCase.call(params: params);
      searchNewsItem.addAll(response.news!);
      isLoading.toggle();
    }catch(e){
      isLoading.toggle();
    }
  }
}