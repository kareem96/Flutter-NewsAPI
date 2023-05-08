import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/src/data/model/news_response.dart';
import 'package:flutter_news_api/src/domain/use_case/news_use_case.dart';
import 'package:get/get.dart';

class NewsController extends GetxController{
  final NewsUseCase _newsUseCase;
  final newsResponse = NewsResponse();
  RxBool isLoading = false.obs;
  RxBool notFound = false.obs;
  ScrollController scrollController = ScrollController();
  NewsController(this._newsUseCase);

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  Future<void> getNews()async{
    isLoading.toggle();
    try{
      final response = await _newsUseCase.call();
      newsResponse.news = response.news;
      isLoading.value = false;
      update();
    }catch(e){
      isLoading.value = false;
    }
  }
}