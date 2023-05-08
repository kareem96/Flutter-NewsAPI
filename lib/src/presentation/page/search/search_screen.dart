import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/src/presentation/controller/search_controller.dart';
import 'package:flutter_news_api/src/presentation/page/article_web.dart';
import 'package:flutter_news_api/src/presentation/widgets/no_item.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class SearchScreen extends GetView<SearchController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.all(8),
          child: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onSubmitted: (value) =>
                controller.getSearch(params: value),
          ),
        ),
      ),
      body: Obx(() =>
      controller.isLoading.value ? SkeletonListView(): (controller.searchNewsItem.isNotEmpty ? SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  "Found ${controller.searchNewsItem.length} Result",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.searchNewsItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ArticleWebView(
                          url: controller.searchNewsItem[index].url));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Stack(children: [
                            controller.searchNewsItem[index].urlToImage ==
                                null
                                ? Container()
                                : ClipRRect(
                              borderRadius:
                              BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                placeholder: (context,
                                    url) =>
                                    const CircularProgressIndicator(),
                                errorWidget:
                                    (context, url, error) =>
                                    const Icon(Icons.error),
                                imageUrl: controller
                                    .searchNewsItem[index]
                                    .urlToImage ??
                                    '',
                              ),
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
                                      "${controller.searchNewsItem[index].author}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                ),
                              ),
                            ),
                          ]),
                          const Divider(),
                          Text("${controller.searchNewsItem[index].title}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ): NoItemView())),
    );
  }

}