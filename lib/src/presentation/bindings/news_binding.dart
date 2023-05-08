import 'package:flutter_news_api/src/data/remote/remote_data_source.dart';
import 'package:flutter_news_api/src/data/repositories/news_repository_impl.dart';
import 'package:flutter_news_api/src/domain/repositories/news_repository.dart';
import 'package:flutter_news_api/src/domain/use_case/news_use_case.dart';
import 'package:flutter_news_api/src/presentation/controller/news_controller.dart';
import 'package:get/get.dart';

class NewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource(connect: Get.find<GetConnect>()));
    Get.lazyPut<NewsRepository>(() => NewsRepositoryImpl(Get.find<RemoteDataSource>()));
    Get.lazyPut<NewsUseCase>(() => NewsUseCase(Get.find<NewsRepository>()));
    Get.lazyPut<NewsController>(() => NewsController(Get.find<NewsUseCase>()));
  }
}