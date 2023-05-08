import 'package:flutter_news_api/src/data/remote/remote_data_source.dart';
import 'package:flutter_news_api/src/data/repositories/search_repository_impl.dart';
import 'package:flutter_news_api/src/domain/repositories/search_repository.dart';
import 'package:flutter_news_api/src/domain/use_case/search_use_case.dart';
import 'package:flutter_news_api/src/presentation/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource(connect: Get.find<GetConnect>()));
    Get.lazyPut<SearchRepository>(() => SearchRepositoryImpl(Get.find<RemoteDataSource>()));
    Get.lazyPut<SearchUseCase>(() => SearchUseCase(repository: Get.find<SearchRepository>()));
    Get.lazyPut<SearchController>(() => SearchController(Get.find<SearchUseCase>()));
  }
}