import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/models/news_model.dart';
import 'package:news_app/app/data/services/news_service.dart';
import 'package:news_app/core/util/util.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final categories = ['All', 'Science', 'Business', 'Sports'];
  List<NewsModel> newsList = [];
  List<NewsModel> allNews = [];
  bool isLoaading = false;
  late TabController tabController;

  static HomeController get instance => Get.find();
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    getNews(categories[0]);
    getAllNews();
    tabController.addListener(() {
      getNews(categories[tabController.index]);
    });
  }

  getNews(String category) {
    isLoaading = true;
    update();
    NewsSwervice()
        .getNews(category.toLowerCase())
        .then((value) {
          newsList = value;
        })
        .onError((error, _) => Util.showError(error.toString()))
        .whenComplete(() {
          isLoaading = false;
          update();
        });
  }

//for search
  getAllNews() {
    Future.wait(List.generate(categories.length - 1,
        (index) => _fetchNewsByCategory(categories[index + 1])));
  }

  Future _fetchNewsByCategory(String cat) async {
    cat = cat.toLowerCase();
    final list = await NewsSwervice().getNews(cat);
    for (var element in list) {
      element.category = cat;
    }
    allNews.addAll(list);
  }
}
