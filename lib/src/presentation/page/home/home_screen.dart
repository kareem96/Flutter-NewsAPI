import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/src/presentation/controller/news_controller.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import '../../../routes.dart';
import '../article_web.dart';

class HomeScreen extends GetView<NewsController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("News API", style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SEARCH);
              },
              child: const Icon(
                Icons.search_sharp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<NewsController>(
        builder: (controller){
          return controller.isLoading.value ? SkeletonListView() : ListView.builder(
            controller: controller.scrollController,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(5),
                    child: Card(
                      elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(ArticleWebView(
                            url: controller.newsResponse.news![index].url,
                          ));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  controller.newsResponse.news![index].urlToImage == null ?
                                      Container() : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                      imageUrl: controller.newsResponse.news![index].urlToImage ?? "",),
                                    ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Card(
                                      elevation: 0,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.8),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8),
                                        child: Text(
                                            controller.newsResponse.news![index].author ?? "Not Found Author",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Text("${controller.newsResponse.news![index].title}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))
                            ],
                          ),
                        ),
                      ),
                    ),),
                    index == controller.newsResponse.news!.length - 1 &&
                        controller.isLoading == true
                        ? Center(child: CircularProgressIndicator())
                        : SizedBox(),
                  ],
                );
              }, itemCount: controller.newsResponse.news!.length);
        },
      ),
    );
  }

}